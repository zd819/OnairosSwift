# Release provenance

Built with Xcode 26.6 (17F113) from zd819/Onairos-Swift base commit ce767602854ee4ef032d3de69f377dedb8e6f50c plus source-fixes.patch in this directory. The patch captures the modal dismissal, Objective-C static linking, regression test, and release version changes used for this artifact.

The ZIP is the validated production artifact, not the offline sample app. Its default API endpoint is https://api2.onairos.uk and test mode defaults to false. Google sign-in requires host-specific OAuth configuration.

The release workflow publishes this exact ZIP; it does not rebuild the SDK. SHA-256 is recorded in release.json and Package.swift.
