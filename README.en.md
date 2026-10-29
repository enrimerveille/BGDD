<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://github.com/enrimerveille/BGDD/raw/main/assets/wordmark-dark.svg"><img src="https://github.com/enrimerveille/BGDD/raw/main/assets/wordmark-light.svg" width="220" alt="BGDD"></picture></p>
<p align="center"><strong>KEEP THE BYTES.</strong><br>Download videos and audio at the best available quality, straight to your Mac.<br>Optimized for YouTube, Instagram, TikTok, X and Vimeo. On-demand detection of recognized players and direct HTML5 videos on other sites.<br>by Angry Thread</p>
<p align="center"><a href="README.md">Français</a> · English</p>

BGDD is **free proprietary software** pairing a Chrome extension with a local macOS engine. Choose a publication, format and folder: downloading and processing stay on your Mac. No BGDD account, subscription, download server or telemetry.

<!-- bgdd:release:start -->
**Version 0.7.0 — Apple Silicon and Intel.** [Release notes](https://github.com/enrimerveille/BGDD/releases/tag/v0.7.0).

| Your Mac | Download |
|---|---|
| Apple Silicon (ARM64), macOS 27 | [DMG Apple Silicon](https://github.com/enrimerveille/BGDD/releases/download/v0.7.0/BGDD-macOS-arm64.dmg) |
| Intel (x86_64), macOS 26 | [DMG Intel](https://github.com/enrimerveille/BGDD/releases/download/v0.7.0/BGDD-macOS-x86_64.dmg) |
<!-- bgdd:release:end -->

<p align="center"><img src="https://github.com/enrimerveille/BGDD/raw/main/assets/popup-light.png" width="320" alt="BGDD light">&emsp;<img src="https://github.com/enrimerveille/BGDD/raw/main/assets/popup-dark.png" width="320" alt="BGDD dark"></p>

If update checking stops working in an older version, [download the latest release](https://github.com/enrimerveille/BGDD/releases) and update BGDD while keeping your existing Chrome extension.

## Choose a format

| Format | Result |
|---|---|
| Maximum quality | Best accessible streams, without video re-encoding; MKV when needed |
| H.265 | MP4 HEVC from the best accessible source, with hardware conversion when needed. Shown only on compatible Macs |
| Compatible H.264 | Available H.264/AAC streams without transcoding; resolution may be lower |
| Audio original | Best accessible audio track, copied without re-encoding to a suitable container |
| WAV | 24-bit PCM, preserving source sample rate and channels |
| MP3 | Native bitrate when usable MP3 exists; otherwise a chosen conversion up to 320 kb/s |

H.265 balances visual quality, file size and processing time. It may involve lossy conversion and does not guarantee a smaller file than an AV1 or VP9 source. If the result is substantially larger, you can keep the source with Maximum quality or keep the verified H.265 file. Compatible Apple Silicon Macs can convert 4:2:0 SDR 10-bit, HDR10 (PQ) and HLG sources, preserving 10-bit depth and HDR. Compatible H.265 Main/Main 10 sources retain their compressed video without re-encoding on both ARM and Intel. Intel conversion remains limited to 8-bit SDR. For Dolby Vision, HDR10+, 12-bit, 4:2:2/4:4:4 or ambiguous colour information, choose Maximum quality.

MKV videos may require a compatible player such as VLC. Choose **Compatible H.264** for broader playback support.

YouTube, Instagram, TikTok, X and Vimeo have dedicated integrations. On another page, open BGDD to detect recognized players and direct HTTPS video files; explicitly choose a video when several are present. TikTok also offers photo slideshows, original images as ZIP and audio exports. The **B** shortcut on X starts maximum quality. Availability depends on the publication, region and platform changes; universal or private-content access is not promised.


## Reuse your files

Choose **Autre format…** on a completed result to export from its local file: H.265, original audio, WAV or MP3, and H.264 compatible when the existing streams allow copying. The original stays intact. Local export uses the quality and audio track of that file; it cannot recover details lost in an earlier conversion. “Original audio” on a platform means its accessible track, not the author’s master. Secure local export requires a file recorded by BGDD 0.7.0 or later; older results remain available in Finder.

Before downloading, BGDD checks matching entries in its bounded history. You can show the file, export another format, or download again if the publication has changed. Clearing history keeps your files but removes their reuse references.

**Mettre la file en pause** lets the current operation finish. A site reporting HTTP 429 pauses its own pending tasks; other sites and local exports can continue. Resume explicitly when ready, respecting any server delay. No automatic retry or background network check is added.

In settings, configure **Ouvrir BGDD** through Chrome’s keyboard shortcuts. Notifications are off by default and request permission only when enabled; they group completion and attention events without content titles. Source/output information appears once the selected file is known, without promising a future H.265 file size.

## Install

1. Open the DMG for your Mac and choose **Installer BGDD.app**.
2. Read the guide for macOS security permissions before installing. [Gatekeeper guide](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-GATEKEEPER.md).
3. Follow the four steps: install/update, prepare the engine, add to Chrome, then ready. In the engine window, **Continuer** returns to the assistant after the four checks. Help and licenses are included.
4. For first-time Chrome setup, enable **Developer mode** and choose **Load unpacked** using the displayed folder. For an update, **Reload** the existing BGDD card without removing it.
5. In BGDD, choose **Réglages → Vérifier l’installation**, close the popup, return to the assistant and choose **Vérifier la connexion**, then **Terminer**.

Internet is required during installation. No Terminal, Homebrew, separate Python or Node.js installation. The extension is loaded manually and does not receive Chrome Web Store updates. The interface uses French labels. [Detailed guide](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-INSTALL.md).

## Update or uninstall

To upgrade from **0.4.8-rc.10 or earlier**, download the DMG manually; older assistants cannot open this new package. For later versions, check for updates from the installer. Open the new package, then choose **Mettre à jour BGDD** and **Préparer le moteur**. Reload BGDD in Chrome and reload already-open platform pages. Folder, identity, preferences and history stay in place.

Open **Désinstaller BGDD.app** in the DMG, or choose **Maintenance… → Désinstaller** in the installer. Native settings/history removal is optional and unchecked by default. **Downloaded files are retained.** Remove the BGDD card in Chrome afterward.

## Limitations and rights

One active download, five queued tasks and 60 history records. Closing the popup lets transfers continue; quitting Chrome stops them without automatic resume. No resident process or periodic update checks. Existing files are never overwritten. On an exFAT drive, wait for the success message before opening a file: it may appear while its final copy is still being written.

BGDD is free proprietary software. [BGDD terms](https://github.com/enrimerveille/BGDD/blob/main/CONDITIONS.md) preserve third-party license rights. [Licenses and sources](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-LICENSES.md). Download only content you are authorized to keep.
