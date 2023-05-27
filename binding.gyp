  {
  "targets": [
    {
      "target_name": "addon",
      "sources": ["addon.cc"],
      "cflags!": ["-fno-exceptions"],
      "cflags_cc!": ["-fno-exceptions"],
      "conditions": [
        ["OS=='mac'", {
          "conditions": [
            ["'$(target_arch)'=='arm64'", {
              "libraries": [
                "-framework CoreFoundation",
                "-framework CoreGraphics",
                "-framework CoreServices"
              ],
              "xcode_settings": {
                "OTHER_LDFLAGS": [
                  "-framework CoreFoundation",
                  "-framework CoreGraphics",
                  "-framework CoreServices"
                ]
              }
            }],
            ["'$(target_arch)'=='arm'", {
              "libraries": [
                "-framework ApplicationServices",
                "-framework Carbon",
                "-framework CoreFoundation"
              ],
              "xcode_settings": {
                "OTHER_LDFLAGS": [
                  "-framework ApplicationServices",
                  "-framework Carbon",
                  "-framework CoreFoundation"
                ]
              }
            }]
          ]
        }],
        ["OS=='win'", {
          "libraries": [
            "-luser32",
            "-lgdi32",
            "-lkernel32"
          ],
          "msvs_settings": {
            "VCCLCompilerTool": {
              "ExceptionHandling": 1
            }
          }
        }]
      ]
    }
  ]
}
