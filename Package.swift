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
            // v1.2.0: Persona additions, automatic Face ID unlock, and approval flows
            // All dependencies statically linked, resources properly bundled
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.2.0/OnairosSwiftSDK.xcframework.zip",
            checksum: "ca22b9494e3b0da3e12638886dc3f8897ee70ef661031d36b8b4aa015e8302bd"
        ),
    ]
)
