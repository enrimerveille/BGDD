<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="assets/wordmark-dark.svg"><img src="assets/wordmark-light.svg" width="220" alt="BGDD"></picture></p>
<p align="center"><strong>Your videos, in high definition, on your Mac.</strong><br>by Angry Thread</p>
<p align="center"><a href="README.md">Français</a> · English</p>

BGDD is **free proprietary software** pairing a Chrome extension with a local macOS engine. Choose a publication, format and folder: downloading and processing stay on your Mac. No BGDD account, subscription, download server or telemetry.

**Prerelease 0.4.8-rc.9 — Apple Silicon and Intel.** [Release notes](https://github.com/enrimerveille/BGDD/releases/tag/v0.4.8-rc.9).

| Your Mac | Download |
|---|---|
| Apple Silicon (ARM64), macOS 27 | [DMG Apple Silicon](https://github.com/enrimerveille/BGDD/releases/download/v0.4.8-rc.9/BGDD-macOS-arm64.dmg) |
| Intel (x86_64), macOS 26 | [DMG Intel](https://github.com/enrimerveille/BGDD/releases/download/v0.4.8-rc.9/BGDD-macOS-x86_64.dmg) |

<p align="center"><img src="assets/popup-light.png" width="320" alt="BGDD light"><img src="assets/popup-dark.png" width="320" alt="BGDD dark"></p>

If update checking stops working in an older version, [download the latest release](https://github.com/enrimerveille/BGDD/releases) and update BGDD while keeping your existing Chrome extension.

## Choose a format

| Format | Result |
|---|---|
| Maximum quality | Best accessible streams, without video re-encoding; MKV when needed |
| Compatible MP4 | Available H.264/AAC streams without transcoding; resolution may be lower |
| WAV | 24-bit PCM, preserving source sample rate and channels |
| MP3 | Native bitrate when usable MP3 exists; otherwise a chosen conversion up to 320 kb/s |

MKV videos may require a compatible player such as VLC. Choose **Compatible MP4** for broader playback support.

YouTube, X, Instagram and TikTok have dedicated adapters. TikTok also offers photo slideshows, original images as ZIP and audio exports. The **B** shortcut on X starts maximum quality. Availability depends on the publication, region and platform changes; universal or private-content access is not promised.

## Install

1. Open the DMG for your Mac and its single visible app, **BGDD Installer.app**.
2. If macOS blocks opening, personally decide whether to use **System Settings → Privacy & Security → Open Anyway**, when offered. BGDD has **no Developer ID certificate or Apple notarization**. [Gatekeeper guide](docs/DISTRIBUTION-GATEKEEPER.md).
3. Follow the four steps: install/update, prepare the engine, add to Chrome, then ready. Help and licenses are included in the assistant.
4. For first-time Chrome setup, enable **Developer mode** and choose **Load unpacked** using the displayed folder. For an update, **Reload** the existing BGDD card without removing it.
5. In BGDD, choose **Réglages → Vérifier l’installation**, close the popup, return to the assistant and choose **Vérifier la connexion**, then **Terminer**.

Internet is required during installation. No Terminal, Homebrew, separate Python or Node.js installation. The extension is loaded manually and does not receive Chrome Web Store updates. The interface uses French labels. [Detailed guide](docs/DISTRIBUTION-INSTALL.md).

## Update or uninstall

Check for updates from the installer. Open the new package, then choose **Mettre à jour BGDD** and **Ouvrir BGDD Engine**. Reload BGDD in Chrome and reload already-open platform pages. Folder, identity, preferences and history stay in place.

Remove the extension in Chrome, then choose **Maintenance… → Désinstaller** in the installer. Removing native preferences is a separate explicit choice. **Downloaded files are retained.**

## Limitations and rights

One active download, five queued tasks and 60 history records. Closing the popup lets transfers continue; quitting Chrome stops them without automatic resume. No resident process or periodic update checks. Existing files are never overwritten. On an exFAT drive, wait for the success message before opening a file: it may appear while its final copy is still being written.

BGDD is free proprietary software. [BGDD terms](LICENSE-BGDD.txt) preserve third-party license rights. [Licenses and sources](docs/DISTRIBUTION-LICENSES.md). Download only content you are authorized to keep.
