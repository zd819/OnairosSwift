# OnairosSwift 1.3.0

- Align welcome copy and rotating examples with the React Native SDK. Refine trust-row spacing and animated consent disclosures; keep disclosure separate from permission selection and raw sharing opt-in.
- Use password terminology throughout creation, unlock, remembered credentials, Face ID prompts, and errors. Resolve create-versus-unlock before leaving the preceding screen to remove the intermediate checking-screen flash.
- Honor host-provided connected-source snapshots, including empty snapshots. Support persona refresh for connected Swift manual sources while retaining existing connections.
- Protect native raw-chat exports through bounded backend privacy jobs with receipt validation, account checks, cancellation, and cleanup.
- Add permission-scoped device-personalization request/get/cancel/open APIs and route device model responses through them.
- Add TikTok system-browser authorization and optional host-provided official TikTok/Discord SDK adapter support. Add explicit Sephora shopping import with rounded artwork and authenticated storage.
- Preserve existing add-to-persona, automatic returning-user Face ID, password fallback, and app-approval flows.

Requires iOS 17+. Includes device arm64 and simulator arm64/x86_64 binaries with dependencies and resources bundled. Import `OnairosSDK` using the `OnairosSwiftSDK` package product. Production remains the default backend; test mode is disabled by default.

TikTok requires the consuming app's registered callback URL. Discord requires a host adapter. Device personalization and protected raw imports require their corresponding backend support. This release does not make the Swift and React Native platform catalogs identical.

Validation: 198 source regression tests passed. Release SDK builds and standalone binary-only consumer builds passed for device and simulator. Public interfaces, new resources, archive integrity and checksum were verified. The SDK Lab was run against this exact local binary, and the user reported a successful simulator walkthrough. Physical-device Face ID and every individual live connector were not verified during packaging.
