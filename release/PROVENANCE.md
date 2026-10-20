# Release provenance

Version: 1.3.0

Source: `zd819/Onairos-Swift` commit `952cc2afc8fd0cf16b71fd39ff4443bf04e48281` (master).

Built from an isolated archive of that pushed commit using Xcode 26.6 (17F113) and the committed Package.resolved. Command: `SDK_VERSION=1.3.0 DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer bash Scripts/build-xcframework-static.sh`. No runtime source patch was applied.

The ZIP contains iOS 17+ Release builds for device arm64 and simulator arm64/x86_64. Dependencies are statically bundled and resource bundles included. All nine Swift interface files passed the public API and dependency-exposure checks. The new copy catalog, import scripts and artwork match the source resources.

198 source regression tests passed before packaging. Separate consumer applications compiled and linked for device and simulator using only the extracted release ZIP, with no source SDK or separately declared third-party dependencies. Compile-only coverage also exercised the new configuration, native connector and device-personalization APIs. Consumer builds had nonblocking Lab warnings about a non-frozen enum switch and orientation settings.

The user completed a successful simulator walkthrough using SDK Lab configured with this exact local binary. This does not establish physical-device Face ID, all live provider connectors, or all production-backend flows. Production defaults remain https://api2.onairos.uk and test mode false; the Lab retains its own configured backend.

The publication workflow uploads this exact ZIP without rebuilding it. SHA-256 / SPM checksum: `762a010fff2d744f105b636d45c6078218e656f33b61addc8f38b75041f9e240`. This matches release.json and Package.swift. Preparing these files did not publish a release; pushing the release changes to main triggers the existing publication workflow.
