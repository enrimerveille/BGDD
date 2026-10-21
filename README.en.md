<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="assets/wordmark-dark.svg"><img src="assets/wordmark-light.svg" width="220" alt="BGDD"></picture></p>
<p align="center"><strong>Your videos, in high definition, on your Mac.</strong><br>by Angry Thread</p>
<p align="center"><a href="README.md">Français</a> · English</p>

BGDD is **free proprietary software** pairing a Chrome extension with a local macOS engine. Choose a publication, format and folder: downloading and processing stay on your Mac. No BGDD account, subscription, download server or telemetry.

**Prerelease 0.4.8-rc.6 — Apple Silicon, macOS 27 only.** [Download the ARM DMG](https://github.com/enrimerveille/BGDD-downloads/releases/download/v0.4.8-rc.6/BGDD-macOS-arm64.dmg) · [Release, checksums and third-party source kit](https://github.com/enrimerveille/BGDD-downloads/releases/tag/v0.4.8-rc.6). macOS 26 is not yet qualified for this version; Intel is in preparation. [Evidence and limitations](docs/DISTRIBUTION-VALIDATION.md).

<p align="center"><img src="assets/popup-light.png" width="320" alt="BGDD light"><img src="assets/popup-dark.png" width="320" alt="BGDD dark"></p>

Actual popup screenshots using a demonstration post and empty history.

## Choose a format

| Format | Result |
|---|---|
| Maximum quality | Best accessible streams, without video re-encoding; MKV when needed |
| Compatible MP4 | Available H.264/AAC streams without transcoding; resolution may be lower |
| WAV | 24-bit PCM, preserving source sample rate and channels |
| MP3 | Native bitrate when usable MP3 exists; otherwise a chosen conversion up to 320 kb/s |

YouTube, X, Instagram and TikTok have dedicated adapters. TikTok also offers photo slideshows, original images as ZIP and audio exports. The **B** shortcut on X starts maximum quality. Availability depends on the publication, region and platform changes; universal or private-content access is not promised. [Evidence and limitations](docs/DISTRIBUTION-VALIDATION.md).

The installer automatically follows the macOS light or dark appearance, including changes while it is open.

<p align="center"><img src="assets/installer-light.png" width="360" alt="Light installer"><img src="assets/installer-dark.png" width="360" alt="Dark installer"></p>

Actual AppKit window captures. ARM and Intel share the interface; Intel qualification remains separate.

## Install

1. Download an approved release DMG and open **BGDD Installer.app**.
2. If macOS blocks it, use **System Settings → Privacy & Security → Open Anyway**, when offered, and confirm yourself. BGDD has **no Developer ID certificate or Apple notarization**. [Gatekeeper guide](docs/DISTRIBUTION-GATEKEEPER.md).
3. Choose **Installer / Mettre à jour**. Internet is required: yt-dlp and Deno are downloaded directly from their official releases at fixed versions, with integrity checks.
4. Choose **Ouvrir le moteur**. The **BGDD — préparer le moteur** window checks the versions of yt-dlp, Deno, FFmpeg and ffprobe without downloading media. It stops at the first failure; read the tool name and message, personally decide any opening offered by macOS, then reopen the engine. Choose **Vérifier les composants** afterwards.
5. Choose **Préparer Chrome**, open the copied address, enable **Developer mode**, select **Load unpacked**, and choose the shown folder.
6. Open BGDD and choose **Réglages → Vérifier l’installation**.

No Terminal, Homebrew, separate Python or Node.js installation. Chrome loading is manual, normally intended for development, and does not provide Chrome Web Store updates. The interface uses French labels. [Detailed guide](docs/DISTRIBUTION-INSTALL.md).

The candidate groups executables inside BGDD Engine.app and distinguishes guardian failures from tool failures. See [validation](docs/DISTRIBUTION-VALIDATION.md) for the tested scope and release limitations. An isolated Chrome profile does not mean a Mac with fresh Gatekeeper trust history.

## Update or uninstall

Update checks are voluntary and use this distribution repository. Choose the package after integrity verification, authorize its opening if macOS requests it, then choose **Installer / Mettre à jour** and **Ouvrir le moteur**. Reload BGDD in Chrome and reload already-open platform pages. Folder, identity, preferences and history stay in place.

Remove the extension in Chrome, then choose **Désinstaller** in the installer. Removing native preferences is a separate explicit choice. **Downloaded files are retained.**

## Limitations and rights

One active download, five queued tasks and 60 history records. Closing the popup lets transfers continue; quitting Chrome stops them without automatic resume. No resident process or periodic update checks. APFS uses exclusive atomic publication; on observed exFAT, a verified exclusive copy may be visible while writing.

Original source remains private. The extension’s required JavaScript is inspectable, without aggressive obfuscation. [BGDD terms](LICENSE-BGDD.txt) preserve third-party license rights. [Licenses and sources](docs/DISTRIBUTION-LICENSES.md). Download only content you are authorized to keep.
