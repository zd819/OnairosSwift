#!/usr/bin/env python3
"""Validate the exact artifact before any release is created."""
import hashlib
import json
import os
from pathlib import Path
import plistlib
import re
import zipfile

root = Path(__file__).resolve().parents[1]
metadata = json.loads((root / "release/release.json").read_text())
version = metadata["version"]
assert re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+", version), "Invalid release version"
archive = root / "release/OnairosSwiftSDK.xcframework.zip"
checksum = hashlib.sha256(archive.read_bytes()).hexdigest()
assert checksum == metadata["sha256"], "Release checksum mismatch"
manifest = (root / "Package.swift").read_text()
url = f"https://github.com/zd819/OnairosSwift/releases/download/v{version}/{archive.name}"
assert f'url: "{url}"' in manifest, "Manifest release URL mismatch"
assert f'checksum: "{checksum}"' in manifest, "Manifest checksum mismatch"
with zipfile.ZipFile(archive) as package:
    assert package.testzip() is None, "Corrupt ZIP"
    prefix = "OnairosSwiftSDK.xcframework/"
    info = plistlib.loads(package.read(prefix + "Info.plist"))
    libraries = info["AvailableLibraries"]
    assert {x["LibraryIdentifier"] for x in libraries} == {"ios-arm64", "ios-arm64_x86_64-simulator"}
    for library in libraries:
        framework = prefix + library["LibraryIdentifier"] + "/OnairosSDK.framework/"
        details = plistlib.loads(package.read(framework + "Info.plist"))
        assert details["CFBundleShortVersionString"] == version
        assert details["MinimumOSVersion"] == "17.0"
        for resource in ["approval-success.wav", "DMSans.ttf", "parity-lock.json", "appExperienceCopy.json", "sephora-extract.js", "sephora-normalize.js", "sephoralogo.png", "tiktok.png"]:
            assert framework + "OnairosSDK_OnairosSDK.bundle/" + resource in package.namelist()
    interfaces = [n for n in package.namelist() if n.endswith(".swiftinterface")]
    assert interfaces
    for name in interfaces:
        interface = package.read(name).decode()
        assert "$NonescapableTypes" not in interface
        assert "addingToPersona: Swift.Bool" in interface, f"Missing add-to-persona API in {name}"
        assert re.search(r"createConnectButton\(text:.*completion:", interface), f"Missing completion-taking button API in {name}"
        assert not re.search(r"^import (Lottie|SocketIO|GoogleSignIn|Starscream)\b", interface, re.M), f"Exposed bundled dependency in {name}"
        for api in ["createConnectButton", "public init(apiKey:", "handleURL", "struct OnboardingData", "DevicePersonalization", "NativeConnectors", "personaRefresh", "requestedScopes"]:
            assert api in interface, f"Missing {api} in {name}"
print(f"Validated v{version}: {checksum}")
if os.environ.get("GITHUB_OUTPUT"):
    with open(os.environ["GITHUB_OUTPUT"], "a") as output:
        output.write(f"tag=v{version}\nchecksum={checksum}\n")
