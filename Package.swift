// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// This package distributes OnairosSDK as a pre-compiled binary framework
// Source code is kept private; only the compiled XCFramework is distributed
// Distribution repo: https://github.com/zd819/OnairosSwift

let package = Package(
    name: "OnairosSDK",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "OnairosSDK",
            targets: ["OnairosSDK"]
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
            name: "OnairosSDK",
            // Binary releases are uploaded to GitHub Releases
            // URL format: https://github.com/zd819/OnairosSwift/releases/download/v{VERSION}/OnairosSDK.xcframework.zip
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.0.0/OnairosSDK.xcframework.zip",
            // Checksum is automatically updated by GitHub Actions after each build
            // To compute manually: swift package compute-checksum OnairosSDK.xcframework.zip
            checksum: "PLACEHOLDER_CHECKSUM_WILL_BE_UPDATED_ON_FIRST_RELEASE"
        ),
    ]
)

