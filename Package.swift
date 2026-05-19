// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// OnairosSwiftSDK - Pre-compiled binary with all dependencies statically linked
// Customers only need to add this ONE package - no additional dependencies required
// Distribution repo: https://github.com/zd819/OnairosSwift

let package = Package(
    name: "OnairosSwiftSDK",
    platforms: [
        .iOS(.v17)
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
            // v1.1.4: Modal/logout controls + returning user routing fixes
            // All dependencies statically linked, resources properly bundled
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.1.4/OnairosSwiftSDK.xcframework.zip",
            checksum: "404972e0479ec03f6748634a283155a5b898714812c8eef2f72fa2d8ebe19625"
        ),
    ]
)
