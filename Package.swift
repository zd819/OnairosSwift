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
            // v1.3.0: React Native parity, consent, native imports, and password flow refinements
            // All dependencies statically linked, resources properly bundled
            url: "https://github.com/zd819/OnairosSwift/releases/download/v1.3.0/OnairosSwiftSDK.xcframework.zip",
            checksum: "762a010fff2d744f105b636d45c6078218e656f33b61addc8f38b75041f9e240"
        ),
    ]
)
