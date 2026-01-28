// OnairosSDKWrapper - Re-exports the binary SDK module
// This wrapper exists to link the binary XCFramework with its dependencies
// since Swift Package Manager binaryTargets cannot declare dependencies directly.

@_exported import OnairosSDK
