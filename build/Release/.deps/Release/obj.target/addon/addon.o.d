cmd_Release/obj.target/addon/addon.o := c++ -o Release/obj.target/addon/addon.o ../addon.cc '-DNODE_GYP_MODULE_NAME=addon' '-DUSING_UV_SHARED=1' '-DUSING_V8_SHARED=1' '-DV8_DEPRECATION_WARNINGS=1' '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D_GLIBCXX_USE_CXX11_ABI=1' '-D_DARWIN_USE_64_BIT_INODE=1' '-D_LARGEFILE_SOURCE' '-D_FILE_OFFSET_BITS=64' '-DOPENSSL_NO_PINSHARED' '-DOPENSSL_THREADS' '-DBUILDING_NODE_EXTENSION' -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/src -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/deps/openssl/config -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/deps/openssl/openssl/include -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/deps/uv/include -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/deps/zlib -I/Users/shadabali/Library/Caches/node-gyp/18.14.2/deps/v8/include  -O3 -gdwarf-2 -mmacosx-version-min=10.15 -arch arm64 -Wall -Wendif-labels -W -Wno-unused-parameter -std=gnu++17 -stdlib=libc++ -fno-rtti -fno-exceptions -fno-strict-aliasing -MMD -MF ./Release/.deps/Release/obj.target/addon/addon.o.d.raw   -c
Release/obj.target/addon/addon.o: ../addon.cc \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/node.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/cppgc/common.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8config.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-array-buffer.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-local-handle.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-internal.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-version.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-object.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-maybe.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-persistent-handle.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-weak-callback-info.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-primitive.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-data.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-value.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-traced-handle.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-container.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-context.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-snapshot.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-date.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-debug.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-script.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-message.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-exception.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-extension.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-external.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-function.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-function-callback.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-template.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-memory-span.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-initialization.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-callbacks.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-isolate.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-embedder-heap.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-microtask.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-statistics.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-promise.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-unwinder.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-embedder-state-scope.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-platform.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-json.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-locker.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-microtask-queue.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-primitive-object.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-proxy.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-regexp.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-typed-array.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-value-serializer.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-wasm.h \
  /Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/node_version.h
../addon.cc:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/node.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/cppgc/common.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8config.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-array-buffer.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-local-handle.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-internal.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-version.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-object.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-maybe.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-persistent-handle.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-weak-callback-info.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-primitive.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-data.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-value.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-traced-handle.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-container.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-context.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-snapshot.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-date.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-debug.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-script.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-message.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-exception.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-extension.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-external.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-function.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-function-callback.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-template.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-memory-span.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-initialization.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-callbacks.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-isolate.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-embedder-heap.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-microtask.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-statistics.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-promise.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-unwinder.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-embedder-state-scope.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-platform.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-json.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-locker.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-microtask-queue.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-primitive-object.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-proxy.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-regexp.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-typed-array.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-value-serializer.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/v8-wasm.h:
/Users/shadabali/Library/Caches/node-gyp/18.14.2/include/node/node_version.h:
