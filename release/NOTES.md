# OnairosSwift 1.2.0

- Add to an existing persona from inside a consuming app using `OnairosConfig(addingToPersona: true)`. Existing connections are retained; this mode allows additions without disconnection. Hosts can use the button title **Add to your Onairos persona**.
- Returning persona unlock automatically attempts Face ID once for an enrolled, matching device credential, with secret-code entry on cancellation or failure. Optional local enrollment follows successful secret-code creation; the backend still authorizes every unlock.
- Improve native app approval, permission-scoped data fetching, dismissal handling, and the explicit confirmation shown when returning to the consumer app.
- Refine onboarding and Smart Filter interactions, platform connection animations, and chat-import progress reporting.
- Restore connected persona artwork and fix email/verification-code paste handling.

Requires iOS 17+. Includes device arm64 and simulator arm64/x86_64 binaries with dependencies and resources bundled. Import `OnairosSDK` using the `OnairosSwiftSDK` package product. Production remains the default backend; test mode remains disabled by default.

For Face ID, the consuming app must provide `NSFaceIDUsageDescription`. Local Face ID enrollment is separate from the server-side **Remember my PIN** preference. Explicit SDK logout removes the local saved credential.

Validation: all 181 regression tests passed. Device and simulator release builds and standalone binary-only consumer builds passed. Exported APIs, resource presence, archive integrity, and checksum were verified; bundled onboarding fonts/artwork were checked in the simulator. Real-device Face ID and a full live production authentication flow were not exercised during packaging and remain post-publication acceptance checks.
