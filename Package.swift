// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// OnairosSwiftSDK - Pre-compiled binary with all dependencies statically linked
// Customers only need to add this ONE package - no additional dependencies required
// Distribution repo: https://github.com/zd819/OnairosSwift

let package = Package(
    name: "OnairosSwiftSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "OnairosSwiftSDK",
            targets: ["OnairosSDKBinary"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "OnairosSDKBinary",
            // v1.0.2: All dependencies (SocketIO, GoogleSignIn, Lottie) are now statically linked
            // Customers no longer need to add any additional packages
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.0.2/OnairosSwiftSDK.xcframework.zip",
            checksum: "b4f70e56f10f1a40dee5cc0448a24b81cdbdeb1a2f8a52bebc94b4cb27cb3926"
        ),
    ]
)
