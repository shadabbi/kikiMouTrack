{
  "targets": [
    {
      "target_name": "addon",
      "sources": ["addon.cc"],
      "cflags!": ["-fno-exceptions"],
      "cflags_cc!": ["-fno-exceptions"],
      "libraries": [
        "-framework ApplicationServices",
        "-framework Carbon",
        "-framework CoreFoundation"
      ],
      "xcode_settings": {
        "OTHER_LDFLAGS": [
          "-framework ApplicationServices"
        ]
      }
    }
  ]
}