// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CPaaSSDK",
    platforms: [
                .iOS(.v12)
               ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CPaaSSDK",
            targets: ["WebRTC","CPaaSSDKFramework","iOSLibrary"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/barisgorgun/SPMWebRTC.git", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WebRTC",
            dependencies: [.product(name: "WebRTC", package: "SPMWebRTC")]),
        .target(
                    name: "iOSLibrary",
                    cSettings: [
                        .define("OTHER_LDFLAGS", to: "-ObjC")
                    ], linkerSettings: [
                        .linkedFramework("AudioToolbox"),
                        .linkedFramework("VideoToolbox"),
                        .linkedFramework("SystemConfiguration"),
                        .linkedFramework("AVFoundation"),
                        .linkedFramework("GLKit"),
                        .linkedFramework("PushKit"),
                        .linkedFramework("CFNetwork"),
                        .linkedFramework("Security"),
                        .linkedFramework("OpenGLES"),
                        .linkedFramework("QuartzCore"),
                        .linkedFramework("CoreAudio"),
                        .linkedFramework("CoreMedia"),
                        .linkedFramework("CoreVideo"),
                        .linkedFramework("CoreGraphics"),
                        .linkedLibrary("c++"),
                        .linkedLibrary("z"),
                        .linkedLibrary("icucore"),
                        .linkedLibrary("sqlite3"),
                        .linkedLibrary("stdc++"),
                    ]),
        .binaryTarget(name: "CPaaSSDKFramework",
                      path: "CPaaSSDK.xcframework"),
       
    ]
)
