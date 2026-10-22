# OnairosSwift 1.4.0

- Insufficient model data now lets users continue through consent and complete onboarding without a warning screen. The developer receives `trainingError`, `trainingGuard`, `isTrainingBlocked: false`, and `dataErrors` in completion `userData`; `apiResponse` contains the terminal error when auto-fetch is enabled. Unavailable personality profiles or preferences are not marked ready. Standard personality requests below 5 points and allowlisted requests below 3 points use this same nonblocking result; thresholds remain backend-owned and unchanged.
- Stop retrying terminal insufficient-data responses from consent handoff, final fetch and training polling. Keep authentication and authorization failures separate.
- Clear the terminal result when a user explicitly starts new training, and preserve the connection-required screen for `NO_CONNECTIONS`.
- Retain foreground fast training by default: `backgroundLoadData=false`, `trainingScreenMode=.fast`. Background loading returns pending metadata and uses no training screen.

Requires iOS 17+. Includes device arm64 and simulator arm64/x86_64 binaries, dependencies and resources. Import `OnairosSDK` through the `OnairosSwiftSDK` package product.

Validation: coordinator and consent-handoff regression suites, static device/simulator builds, exported-interface checks, package resource verification, archive integrity and SHA-256 checks. No physical-device or live-provider test was run for this change.
