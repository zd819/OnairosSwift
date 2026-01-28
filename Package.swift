// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// This package distributes OnairosSwiftSDK as a pre-compiled binary framework
// Source code is kept private; only the compiled XCFramework is distributed
// Distribution repo: https://github.com/zd819/OnairosSwift

let package = Package(
    name: "OnairosSwiftSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "OnairosSwiftSDK",
            targets: ["OnairosSwiftSDK"]
        ),
    ],
    dependencies: [
        // Dependencies that consumers also need (transitive dependencies)
        .package(url: "https://github.com/socketio/socket.io-client-swift", from: "16.0.0"),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.3.0"),
    ],
    targets: [
        .binaryTarget(
            name: "OnairosSwiftSDK",
            // Binary releases are uploaded to GitHub Releases
            // URL format: https://github.com/zd819/OnairosSwift/releases/download/v{VERSION}/OnairosSwiftSDK.xcframework.zip
            // v1.0.1: Fixed module stability for Swift 6.2 compatibility - renamed main class to Onairos
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.0.1/OnairosSwiftSDK.xcframework.zip",
            // To compute: swift package compute-checksum OnairosSwiftSDK.xcframework.zip
            checksum: "4769bd418d1ef98869119da430815d2e8a35f9bcc782c7e543bff4cee360c455"
        ),
    ]
)
