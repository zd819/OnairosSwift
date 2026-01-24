# OnairosSwiftSDK

OnairosSwiftSDK is a Swift SDK for integrating Onairos authentication and AI personality services into your iOS applications.

## Installation

### Swift Package Manager

Add OnairosSwiftSDK to your project using Swift Package Manager:

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/zd819/OnairosSwift
   ```
3. Select the version you want to use
4. Click **Add Package**

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/zd819/OnairosSwift", from: "1.0.0")
]
```

Then add `OnairosSwiftSDK` to your target's dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: ["OnairosSwiftSDK"]
)
```

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15.0+

## Usage

```swift
import OnairosSwiftSDK

// Initialize the SDK
let onairos = OnairosSDK.shared

// Configure with your API key
onairos.configure(apiKey: "your-api-key")

// Present the onboarding flow
onairos.presentOnboarding(from: viewController) { result in
    switch result {
    case .success(let user):
        print("User authenticated: \(user)")
    case .failure(let error):
        print("Error: \(error)")
    }
}
```

## Documentation

For detailed documentation and integration guides, visit our [developer portal](https://docs.onairos.uk).

## License

Copyright © 2026 Onairos. All rights reserved.
