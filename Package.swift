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
            // v3.0.73: UI polish, LinkedIn URL sync, consent screen with 4 data tiers, ChatGPT 20 conversations
            // All dependencies statically linked, resources properly bundled
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.1.0/OnairosSwiftSDK.xcframework.zip",
            checksum: "31d1b5b21475a7f715aa49a8756edde3b95b942fc602870cebf22647ed326b6c"
        ),
    ]
)
