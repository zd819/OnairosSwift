# OnairosSwiftSDK

Native Onairos onboarding for iOS, distributed as a precompiled XCFramework with its dependencies and resources included.

## Installation

In Xcode, choose **File → Add Package Dependencies**, enter `https://github.com/zd819/OnairosSwift`, and select version **1.1.8 or later**. Add the **OnairosSwiftSDK** product to your app target.

Requires iOS 17 or later. The package manifest uses Swift tools 5.9; the binary was built with Xcode 26.6. Device arm64 and simulator arm64/x86_64 are included.

## Usage

```swift
import OnairosSDK

Onairos.shared.initialize(config: OnairosConfig(apiKey: "your-onairos-api-key"))
let button = Onairos.shared.createConnectButton { result in
    // Handle completion or cancellation.
}
// Add button to your view and position it with your layout constraints.
```

The default button title is **Continue with Onairos**. The SDK defaults to `https://api2.onairos.uk`, with test mode disabled.

## Google sign-in

Pass your app's iOS OAuth client ID using `OnairosConfig(apiKey:googleClientID:)`, register its reversed client ID URL scheme in your app's Info.plist, and forward authentication callback URLs to `Onairos.shared.handleURL(url)`. The SDK includes Google sign-in; no separate Google implementation or manual `-ObjC` linker flag is required. Your OAuth client must be registered for the host app's bundle ID.

## Publishing

A push to **main** that changes the release inputs runs **Publish Swift SDK**. It verifies the ZIP against Package.swift and release/release.json, creates the version tag and GitHub Release at that commit, uploads the binary, and verifies the uploaded checksum. GitHub Actions must be enabled for this repository. No separate personal token is required; the workflow uses the repository's GitHub token.

The checked-in release ZIP is intentional: it makes pushing main sufficient to publish the already-validated artifact. Do not replace a published version. For the next release, update the ZIP, version, checksum, notes, and manifest together. Re-running publication for an existing version fails rather than overwriting it.

See release/PROVENANCE.md for the build source and release/NOTES.md for changes.

## License

Copyright © 2026 Onairos. All rights reserved.
