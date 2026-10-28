# BGDD rc4 — composants tiers et accès aux sources

Le code original de l’application BGDD est gratuit et propriétaire, copyright © 2026 Angry Thread. **Cette mention ne couvre pas les composants ci-dessous**, leurs fontes, leurs sources ou leurs recettes sous licence libre.

## Composants fournis dans le paquet BGDD

| Composant | Version et origine | Licence | Sources et notices fournies |
|---|---|---|---|
| FFmpeg / ffprobe | 9.0.2, sources [FFmpeg](https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz), build arm64 Angry Thread | GPL-2.0-or-later pour le build avec x264 | Archive exacte, GPL/LGPL upstream, options, compilateur, recette `build-codecs.sh` réellement exécutée et recette indépendante de remplacement |
| x264 | Commit `0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee`, [VideoLAN](https://code.videolan.org/videolan/x264) | GPL-2.0-or-later | Archive exacte, copyright/licence upstream et compilation statique dans la recette codec |
| LAME | 3.100, [source officielle](https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz) | LGPL-2.0-or-later | Archive exacte et LGPL ; sources du programme utilisant la bibliothèque et recette permettant de rééditer les liens |
| Space Grotesk | Version 2.000, [Google Fonts, révision exacte](https://github.com/google/fonts/tree/2861cb7b12f90c0a294a12ed666e381e2211872f/ofl/spacegrotesk) | SIL OFL 1.1 | Copyright 2020 The Space Grotesk Project Authors, OFL et TTF original ; WOFF2 local sous OFL |

Les sources et recettes codec sont fournies dans [sources/](sources/README.md). Les licences complètes sont dans [licenses/](licenses/). Le kit **BGDD-third-party-sources.zip** de la même release comprend aussi le TTF original et la licence Space Grotesk ; aucun téléchargement public n’est disponible tant que la candidate est préparée en privé. Elle n’est pas remplacée par un lien générique vers un projet. Les instructions du kit concernent la reconstruction volontaire des codecs ; l’utilisation ordinaire de BGDD ne requiert pas d’outil de développement.

Aucun des trois codes sources codec n’a été modifié dans le build de référence. Les options et la cible macOS 26.0 sont enregistrées. Les références de copyright précises de leurs nombreux auteurs sont conservées dans les archives entières et licences originales. FFmpeg est une marque de Fabrice Bellard ; l’usage du moteur n’implique pas une affiliation.

## Composants obtenus directement auprès de leurs éditeurs

Le paquet hybride rc4 **ne contient ni ne redistribue** les archives ou exécutables suivants. L’installateur les demande directement sur votre Mac, après votre action, via HTTPS et des URLs de releases fixées ; chaque archive est vérifiée par son SHA-256 avant préparation.

| Composant | Version | Origine officielle | Licence et notices |
|---|---|---|---|
| yt-dlp macOS onedir, Python privé et dépendances | 2026.08.19 | [Release officielle](https://github.com/yt-dlp/yt-dlp/releases/tag/2026.08.19) | Le bundle PyInstaller combiné relève de GPL-3.0-or-later ; la source du projet yt-dlp est Unlicense. [Qualification amont](https://github.com/yt-dlp/yt-dlp/blob/2026.08.19/README.md#licensing), [notices tierces amont](https://github.com/yt-dlp/yt-dlp/blob/2026.08.19/THIRD_PARTY_LICENSES.txt) ; les notices présentes dans l’archive téléchargée sont conservées |
| Deno arm64 | 2.9.7 | [Release officielle](https://github.com/denoland/deno/releases/tag/v2.9.7) | Deno original sous [MIT](https://github.com/denoland/deno/blob/v2.9.7/LICENSE.md), avec V8/TypeScript/Rust et autres licences propres. [Source exacte](https://github.com/denoland/deno/tree/v2.9.7), [verrou source](https://github.com/denoland/deno/blob/v2.9.7/Cargo.lock) |
| EJS local, inclus dans l’archive yt-dlp | 0.8.0 | [Distribution source officielle](https://pypi.org/project/yt-dlp-ejs/0.8.0/) | Unlicense ; Meriyah 6.1.4 ISC et Astring 1.9.0 MIT, notices intégrées aux fichiers JS et à la notice yt-dlp |

Les URLs, versions et empreintes d’archives sont détaillées dans [les références upstream](licenses/UPSTREAM-LICENSE-LINKS.json). Aucun miroir Angry Thread, paquet réhébergé ou téléchargement silencieux d’une version future n’est prévu. Internet est nécessaire pendant la première installation ou une réparation des moteurs ; aucune connexion permanente à GitHub n’est nécessaire au repos.

Le choix de récupération directe est une modification du périmètre réel de fourniture. Il ne renonce à aucune licence et ne prétend pas clôturer les réserves de l’ancien audit du bundle yt-dlp et des notices Deno. Replacer ces binaires dans un paquet ou un asset BGDD exigerait la clôture préalable de ces obligations de redistribution.

## Exercer les droits sur les tiers

Les conditions propriétaires BGDD ne restreignent pas les droits accordés sur les logiciels tiers, notamment l’étude, la copie, la modification, la reconstruction, la réédition des liens, le débogage et la redistribution sous leurs licences.

Le kit codec fournit une recette indépendante de construction, puis `install-codecs.pl` pour le remplacement volontaire de FFmpeg/ffprobe et la mise à jour de leurs empreintes locales dans une copie détenue par l’utilisateur. Cette opération ne nécessite ni clé privée ni accès au code propriétaire BGDD. Une configuration modifiée n’est pas une release officiellement vérifiée par Angry Thread et peut être remplacée par une réparation ou mise à jour officielle.

Aucun copyright des fontes ou des moteurs n’est transféré à Angry Thread. Les fontes demeurent sous OFL ; les compositions graphiques réalisées avec leurs glyphes n’imposent pas cette licence au code original de l’application.

Les archives, licences et la recette de construction héritées de rc2 sont inchangées. La recette indépendante de remplacement et son guide sont adaptés à engine-app-v2 : nouvelle enveloppe avec quarantaine ordinaire, sauvegarde de l’application initiale et maintien des droits de remplacement. L’assemblage local du moteur après téléchargement direct n’ajoute aucun runtime amont au DMG ou aux assets hébergés par BGDD.

## dav1d 1.5.4

Décodeur AV1 de VideoLAN et des contributeurs dav1d, sous BSD-2-Clause. La licence intégrale, les sources exactes et la recette de construction sont dans les kits de sources tierces de BGDD 0.6.4. Source : https://download.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz
