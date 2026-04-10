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
            // v1.1.1: Welcome redesign, consent API, LinkedIn URL sync, UI fixes
            // All dependencies statically linked, resources properly bundled
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.1.1/OnairosSwiftSDK.xcframework.zip",
            checksum: "ca0046fad8df51f9d1124b32e1404c9296eb8f2700512e7fb0229046b1322047"
        ),
    ]
)
