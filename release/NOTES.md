# OnairosSwift 1.1.8

- Refined native onboarding, permission artwork, button feedback, and account menus.
- Synchronized approval animation and audio, with progressive PIN requirement feedback.
- Onboarding closes through X; dragging or tapping the backdrop no longer dismisses it.
- Google sign-in no longer requires host apps to add the -ObjC linker flag.
- Email sending and verification feedback respect actual server results.

Requires iOS 17+. Includes device arm64 and simulator arm64/x86_64 binaries, bundled dependencies, artwork, fonts, and approval audio. Import OnairosSDK using the OnairosSwiftSDK package product.

Validation: 104 regression tests passed; standalone device and simulator consumer builds passed; Google account chooser and cancellation verified without extra linker flags. Full production authentication was not repeated during release packaging.
