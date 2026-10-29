# Composants de BGDD

BGDD est gratuit et propriétaire pour son code original, copyright © 2026 Angry Thread. Les composants tiers conservent leurs propres licences et droits de modification et de redistribution.

<!-- bgdd:dependencies:start -->
| Composant | Version | Licence | Fourniture |
|---|---|---|---|
| FFmpeg / ffprobe | 9.0.2 | GPL-2.0-or-later | Inclus ; sources et notices conservées |
| x264 | 0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee | GPL-2.0-or-later | Inclus ; sources et notices conservées |
| LAME | 4.0 | LGPL-2.0-or-later | Inclus ; sources et notices conservées |
| dav1d | 1.5.4 | BSD-2-Clause | Inclus ; sources et notices conservées |
| Space Grotesk | 2.000 | OFL-1.1 | Inclus ; sources et notices conservées |
| yt-dlp (bundle macOS) | 2026.10.26 | GPL-3.0-or-later | Acquis directement auprès de l’éditeur |
| Python (runtime yt-dlp) | 3.14.7 | PSF-2.0 et licences associées | Acquis directement auprès de l’éditeur |
| EJS (yt-dlp) | 0.8.0 | Unlicense ; Meriyah ISC et Astring MIT | Acquis directement auprès de l’éditeur |
| Deno | 2.9.8 | MIT et licences des dépendances | Acquis directement auprès de l’éditeur |
<!-- bgdd:dependencies:end -->

Les kits de sources de chaque architecture contiennent les archives complètes, notices et recettes correspondant aux codecs distribués. Le bundle yt-dlp et Deno sont téléchargés directement auprès de leurs éditeurs à la demande ; leurs binaires et archives ne sont pas fournis dans le DMG ou les kits BGDD. Les licences de Python, EJS, V8, TypeScript et des autres dépendances amont demeurent applicables. Les notices incluses dans les archives téléchargées sont conservées.

Les métadonnées de la [release choisie](https://github.com/enrimerveille/BGDD/releases), `VERSIONS-arm64.json`, `VERSIONS-x86_64.json` et `SHA256SUMS`, identifient exactement chaque livraison. Les anciens inventaires datés sont des archives, pas la description des codecs actuels. Zlib et les frameworks macOS sont des dépendances du système ; ils ne sont pas redistribués par BGDD.

[Licences et sources](DISTRIBUTION-LICENSES.md) · [Frontières entre programmes](DISTRIBUTION-BOUNDARIES.md) · [Conditions BGDD](../CONDITIONS.md)
