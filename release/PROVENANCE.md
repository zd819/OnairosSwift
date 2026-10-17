# Release provenance

Version: 1.2.0

The SDK runtime was built from `zd819/Onairos-Swift` commit `e94935f6734e83b2f511edb9038e2872ca2f38cf` using Xcode 26.6 (17F113). Command: `SDK_VERSION=1.2.0 bash Scripts/build-xcframework-static.sh`. No runtime source patch was applied.

Regression validation used source commit `4a672354eb60b8aa90d772291b6e0de50420f141`, which adds only two test corrections to that runtime commit: keeping the approved confirmation after a late duplicate callback, and checking that preview logout resets simulated state while preserving the host session. All 181 tests passed. The runtime sources and package manifest are identical between these commits.

The ZIP contains release builds for iPhone arm64 and simulator arm64/x86_64. Dependencies are statically bundled. Standalone consumer applications built successfully for device and simulator using only this XCFramework, with no source-package dependencies or additional Objective-C linker flags. The simulator consumer checked production defaults, the new add-to-persona configuration, callback API availability, and rendered onboarding with bundled fonts and artwork. Its UI check used offline test mode, without real credentials or live authentication.

Default production API: https://api2.onairos.uk. Test mode defaults to false. Google sign-in requires host-specific OAuth configuration; Face ID requires the host's NSFaceIDUsageDescription and opt-in enrollment on an eligible device. Real-device Face ID and complete live production authentication were deferred to post-publication acceptance testing at the user's request.

The release workflow publishes this exact ZIP without rebuilding it. SHA-256: `ca22b9494e3b0da3e12638886dc3f8897ee70ef661031d36b8b4aa015e8302bd`. The same value is recorded in release.json and Package.swift. The prior release's source-fixes.patch is obsolete and has been removed; this release is reproducible directly from the recorded source commit.
