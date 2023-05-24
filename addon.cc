#include <node.h>
#include <ApplicationServices/ApplicationServices.h>
#include <Carbon/Carbon.h>
#include <CoreFoundation/CoreFoundation.h>
#include <functional>

namespace addon {

using v8::FunctionCallbackInfo;
using v8::Isolate;
using v8::Local;
using v8::Object;
using v8::String;
using v8::Value;
using v8::Function;
using v8::Exception;

std::function<void(const char*)> keyPressCallback;
std::function<void(int, int)> mouseMoveCallback;

CGEventRef HandleKeyboardEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void* refcon) {
  if (type == kCGEventKeyDown) {
    CGKeyCode keyCode = (CGKeyCode)CGEventGetIntegerValueField(event, kCGKeyboardEventKeycode);
    UniCharCount actualStringLength;
    UniChar unicodeString[256];
    UInt32 deadKeyState;
    TISInputSourceRef keyboardLayout = TISCopyCurrentKeyboardLayoutInputSource();
    UCKeyTranslate(
      (const UCKeyboardLayout*)CFDataGetBytePtr((CFDataRef)TISGetInputSourceProperty(keyboardLayout, kTISPropertyUnicodeKeyLayoutData)),
      keyCode,
      kUCKeyActionDown,
      0,
      LMGetKbdType(),
      kUCKeyTranslateNoDeadKeysBit,
      &deadKeyState,
      sizeof(unicodeString) / sizeof(unicodeString[0]),
      &actualStringLength,
      unicodeString
    );

    if (actualStringLength > 0) {
      CFStringRef character = CFStringCreateWithCharacters(kCFAllocatorDefault, unicodeString, actualStringLength);
      if (character != NULL) {
        CFIndex utf8Length = CFStringGetMaximumSizeForEncoding(CFStringGetLength(character), kCFStringEncodingUTF8) + 1;
        char utf8Char[utf8Length];
        CFStringGetCString(character, utf8Char, utf8Length, kCFStringEncodingUTF8);
        printf("Pressed key: %s\n", utf8Char);
        CFRelease(character);

        if (keyPressCallback) {
          keyPressCallback(utf8Char);
        }
      }
    }
  }

  return event;
}

CGEventRef HandleMouseEvent(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void* refcon) {
  if (type == kCGEventMouseMoved) {
    CGPoint mousePosition = CGEventGetLocation(event);
    if (mouseMoveCallback) {
      mouseMoveCallback(static_cast<int>(mousePosition.x), static_cast<int>(mousePosition.y));
    }
  }

  return event;
}

void StartInputTracking(const FunctionCallbackInfo<Value>& args) {
  Isolate* isolate = args.GetIsolate();
  Local<Object> options = Local<Object>::Cast(args[0]);

  // Get the value of the "keyCallback" key from the options object.
  Local<Value> keyCallbackVal = options->Get(isolate->GetCurrentContext(), String::NewFromUtf8(isolate, "keyCallback").ToLocalChecked()).ToLocalChecked();


  // Check if the value of the "keyCallback" key is a Function object.
  if (!keyCallbackVal->IsFunction()) {
    // Throw an exception if the value of the "keyCallback" key is not a Function object.
    isolate->ThrowException(
      Exception::TypeError(
        String::NewFromUtf8(isolate, "Key callback function must be provided.").ToLocalChecked()
      )
    );
    return;
  }

 Local<Value> mouseCallbackVal;
bool hasMouseCallback = options->Get(isolate->GetCurrentContext(), String::NewFromUtf8(isolate, "mouseCallback").ToLocalChecked()).ToLocal(&mouseCallbackVal);

 if (!hasMouseCallback || !mouseCallbackVal->IsFunction()) {
  // Throw an exception if the "mouseCallback" key is missing or not a function
  isolate->ThrowException(
    Exception::TypeError(
      String::NewFromUtf8(isolate, "Mouse callback function must be provided.").ToLocalChecked()
    )
  );
  return;
}

  // Cast the value of the "keyCallback" and "mouseCallback" keys to Function objects.
 Local<Function> keyCallback = Local<Function>::Cast(keyCallbackVal);
Local<Function> mouseCallback = Local<Function>::Cast(mouseCallbackVal);

  // Create new keyPressCallback and mouseMoveCallback functions.
  keyPressCallback = [keyCallback](const char* key) {
    Isolate* isolate = Isolate::GetCurrent();
    v8::HandleScope scope(isolate);

    // Create a new v8::Value object for the key argument.
    Local<Value> keyVal = String::NewFromUtf8(isolate, key).ToLocalChecked();

    // Call the key callback function with the key argument.
    keyCallback->Call(isolate->GetCurrentContext(), isolate->GetCurrentContext()->Global(), 1, &keyVal);
  };

  mouseMoveCallback = [mouseCallback](int x, int y) {
    Isolate* isolate = Isolate::GetCurrent();
    v8::HandleScope scope(isolate);

    // Create new v8::Number objects for the x and y arguments.
    Local<Value> xVal = v8::Number::New(isolate, x);
    Local<Value> yVal = v8::Number::New(isolate, y);

    // Call the mouse callback function with the x and y arguments.
    Local<Value> argv[2] = { xVal, yVal };
    mouseCallback->Call(isolate->GetCurrentContext(), isolate->GetCurrentContext()->Global(), 2, argv);
  };

  // Create a keyboard event tap.
  CFMachPortRef keyboardEventTap = CGEventTapCreate(
    kCGSessionEventTap,
    kCGHeadInsertEventTap,
    kCGEventTapOptionDefault,
    CGEventMaskBit(kCGEventKeyDown),
    HandleKeyboardEvent,
    NULL
  );

  // Create a mouse event tap.
  CFMachPortRef mouseEventTap = CGEventTapCreate(
    kCGSessionEventTap,
    kCGHeadInsertEventTap,
    kCGEventTapOptionDefault,
    CGEventMaskBit(kCGEventMouseMoved),
    HandleMouseEvent,
    NULL
  );

  // Check if the keyboard event tap or mouse event tap was created successfully.
  if (keyboardEventTap == NULL || mouseEventTap == NULL) {
    // Throw an exception if the keyboard event tap or mouse event tap was not created successfully.
    isolate->ThrowException(
      Exception::TypeError(
        String::NewFromUtf8(isolate, "Could not create event taps.").ToLocalChecked()
      )
    );
    return;
  }

  // Create a CFRunLoopSource object for the keyboard event tap.
  CFRunLoopSourceRef keyboardRunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, keyboardEventTap, 0);

  // Create a CFRunLoopSource object for the mouse event tap.
  CFRunLoopSourceRef mouseRunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, mouseEventTap, 0);

  // Check if the CFRunLoopSource objects were created successfully.
  if (keyboardRunLoopSource == NULL || mouseRunLoopSource == NULL) {
    // Throw an exception if the CFRunLoopSource objects were not created successfully.
    isolate->ThrowException(
      Exception::TypeError(
        String::NewFromUtf8(isolate, "Could not create CFRunLoopSource.").ToLocalChecked()
      )
    );
    return;
  }

  // Add the CFRunLoopSource objects to the CFRunLoop.
  CFRunLoopAddSource(CFRunLoopGetCurrent(), keyboardRunLoopSource, kCFRunLoopDefaultMode);
  CFRunLoopAddSource(CFRunLoopGetCurrent(), mouseRunLoopSource, kCFRunLoopDefaultMode);

  // Enable the event taps.
  CGEventTapEnable(keyboardEventTap, true);
  CGEventTapEnable(mouseEventTap, true);

  // Run the CFRunLoop.
  CFRunLoopRun();
}

void StopInputTracking(const FunctionCallbackInfo<Value>& args) {
  CFRunLoopStop(CFRunLoopGetCurrent());
}

void Initialize(Local<Object> exports) {
  NODE_SET_METHOD(exports, "startInputTracking", StartInputTracking);
  NODE_SET_METHOD(exports, "stopInputTracking", StopInputTracking);
}

NODE_MODULE(NODE_GYP_MODULE_NAME, Initialize)

}  // namespace addon