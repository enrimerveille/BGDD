# BGDD rc2 — conformité du périmètre de distribution

12 octobre 2026 · candidat **v0.4.8-rc.2** · code original **gratuit et propriétaire, Angry Thread**. Les versions de produit restent extension 0.4.8, host 0.3.4, Native Messaging 2. La proposition MIT est abandonnée ; aucun droit MIT n’a été accordé par cette proposition.

## Stratégie retenue

Le paquet rc2 est **hybride**. Angry Thread fournit l’application originale, FFmpeg/ffprobe avec leurs sources correspondantes x264/LAME/FFmpeg et recettes indépendantes, ainsi que les fontes/notices nécessaires. yt-dlp, Python/EJS et Deno ne sont pas dans le DMG ou les assets BGDD ; ils sont téléchargés directement sur le Mac de l’utilisateur depuis leurs releases officielles fixes, après son action.

La source du codec et les deux recettes sont concrètement disponibles. Le build de référence a réellement exécuté la recette publique indépendante. La vérification de la source et des licences permet de traiter la redistribution de ce codec ; elle ne qualifie pas l’ancien bundle autonome rc1 comme redistribuable et ne promet pas la clôture de tous les moteurs amont.

Les conditions de distribution distinguent le code original, les tiers, la marque et la documentation. Elles autorisent l’usage gratuit de BGDD et excluent expressément des restrictions propriétaires tous les droits GNU/OFL des tiers, y compris modification, reconstruction, réédition des liens, installation, débogage et redistribution. [Conditions BGDD](../CONDITIONS.md), [analyse des frontières](DISTRIBUTION-BOUNDARIES.md).

## Périmètre original et droits

**Copyright © 2026 Angry Thread. All rights reserved.** Cette mention porte sur les éléments originaux protégeables détenus par Angry Thread : extension, host, gardien, sélecteur, installateur et interface/intégration originales. Elle ne revendique aucun copyright des moteurs, fontes ou contenus téléchargés.

L’éditeur a confirmé ce modèle et cette identité éditoriale. Les sources inspectées n’importent aucune bibliothèque GPL et aucune contribution externe n’y a été identifiée ; l’historique du dépôt de préparation comporte une seule identité d’auteur, Angry Thread. Ce dépôt commence par un snapshot et ne prouve pas à lui seul tous les contrats ou cessions antérieurs non fournis. La documentation publique ne certifie pas des contrats ou cessions non fournis.

Aucun code Swift/TypeScript original ou pipeline privé n’est destiné à la vitrine de distribution. Le JavaScript empaqueté de l’extension est inspectable par nécessité technique ; il ne devient pas open source pour cette raison. Les recettes GPL du kit codec sont des matériaux indépendants de conformité, avec une licence propre et sans code de l’application BGDD.

## Composants réellement fournis

| Composant | Version exacte | Régime fourni | Obligation traitée |
|---|---|---|---|
| FFmpeg / ffprobe | 9.0.2, arm64, cible de build macOS 26.0 | GPL-2.0-or-later, x264 et LAME statiques ; build Angry Thread de sources officielles | Source correspondante intégrale, configuration/compilateur, recettes effectivement utilisées, licences et copyrights d’origine |
| x264 | `0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee` | GPL-2.0-or-later | Archive exacte et recette de compilation/réédition des liens |
| LAME | 3.100 | LGPL-2.0-or-later pour la bibliothèque ; programme FFmpeg globalement GPL | Archive exacte, LGPL et source complète du programme utilisant cette bibliothèque ; reconstruction et remplacement possibles |
| Space Grotesk | Version 2.000, TTF original et WOFF2 local | SIL OFL 1.1 | Copyright 2020 The Space Grotesk Project Authors et OFL conservés ; fonte dérivée sous OFL |

Le build FFmpeg est réellement `--enable-gpl --enable-libx264 --enable-libmp3lame` ; il ne doit pas être nommé LGPL seul. Les liens dynamiques observés sont macOS système ; aucune bibliothèque Homebrew ou nonfree n’est ajoutée. Les fonctionnalités codec requises restent présentes. [Conditions officielles FFmpeg](https://ffmpeg.org/legal.html).

## Source correspondante du codec : preuve réelle

Le kit **BGDD-third-party-sources.zip** de la même release et le paquet lui-même contiennent les trois archives entières, les copyrights/licences originaux et la recette indépendante `build-codecs.sh`. La fourniture ne repose pas sur un lien vers une source « latest » ni sur une équivalence théorique d’instructions. GPLv2 demande aussi les scripts contrôlant compilation et installation. [GPLv2, section 3](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section3).

| Élément contrôlé | SHA-256 / preuve |
|---|---|
| Source FFmpeg 9.0.2 | `8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e` |
| Source x264 exacte | `be32b1e787ca8e905c10b956d2a5be0b99847deea2ff53be0cd93e488cd90323` |
| Source LAME 3.100 | `ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e` |
| Recette réellement exécutée | `build-codecs.sh`, SHA `b1f25e73c14b57ec976b10b0053a1c3e4ef53be6c656c23dc94cc7619bb7216b` |
| FFmpeg avant re-signature de distribution | `1de2c5141c755b2e1287f125c343beb5c375e3a051153284581c5cbb3fa45f2e` |
| ffprobe avant re-signature de distribution | `2f21734945cb34941ceffc826fa96985df852dfb5d161be86ea5b6136e23414a` |

Le build a réellement utilisé `/bin/sh` sur cette recette, Apple Clang 21.0.0 / Xcode 27, SDK 27.0. Les deux Mach-O obtenus sont arm64, `LC_BUILD_VERSION` minimum **26.0**. Aucune modification du code des trois archives n’a été appliquée. Les options exactes et les résultats sont consignés dans `build-record.json` et `FFmpeg-build.txt`. La cible de compilation ne suffit pas à annoncer une compatibilité macOS 26 effectivement validée.

Le pipeline privé consomme ces sorties puis les prépare pour le conteneur. La re-signature ad hoc change les octets et leurs empreintes ; le manifest et les sommes du paquet final sont calculés ensuite. Elle ne prétend ni certifier l’identité Apple de l’éditeur ni supprimer le droit de reconstruire les sources.

## Reconstruction, remplacement et empreintes

Les archives, Makefiles/configure upstream et la recette publique permettent de reconstruire FFmpeg en rééditant les liens avec une version modifiée de LAME ou x264. Aucun objet propriétaire BGDD n’est lié à ces bibliothèques ; leurs liens statiques sont dans le programme codec. Les instructions de modification précisent comment adapter les empreintes de votre copie de la recette au lieu de les présenter comme une interdiction.

La recette indépendante `install-codecs.pl` remplace volontairement les deux codecs d’une installation locale détenue et identifiée et remet leurs empreintes dans les trois fichiers de métadonnées. Elle ne nécessite ni clé privée ni source propriétaire. Les fichiers de l’application, préférences, historique et médias sont exclus du remplacement. Les verrous et la sauvegarde extérieure au dossier BGDD gardent les opérations explicites.

La vérification du host à l’exécution contrôle la présence des outils ; elle ne comporte pas de HMAC propriétaire des codecs. Le contrôle de maintenance compare des SHA lus dans le ledger local, sans clé détenue exclusivement par Angry Thread. Les empreintes sont donc réenregistrables. Les conditions BGDD excluent toute restriction propriétaire sur la modification et le débogage des tiers.

Une recette isolée avec les vrais codecs reconstruits a vérifié l’exécution des deux outils, toutes les nouvelles SHA, la conservation des fichiers de contrôle et le refus d’un lien ou d’un verrou de host actif. Cette preuve mécanique est distincte d’un essai complet avec le cœur de production BGDD, qui doit être confirmé dans le rapport de distribution. Aucun changement n’a été appliqué à l’installation personnelle.

GPLv2 exige ses scripts/source et ne reprend pas automatiquement le régime spécifique d’« Installation Information » de GPLv3. La méthode concrète de reconstruction et de remplacement est fournie sans revendiquer un régime GPLv3 sur le codec de référence. Une réparation officielle peut remettre les codecs de la release d’origine ; les droits de l’utilisateur sur ses sources/modifications ne sont pas supprimés. [FAQ GNU sur l’information d’installation](https://www.gnu.org/licenses/gpl-faq.en.html#InstInfo), [LGPLv2, liens et modification](https://www.gnu.org/licenses/old-licenses/lgpl-2.0.html#section6).

## Moteurs obtenus directement, non fournis par BGDD

| Composant | Version fixée et archive | SHA-256 de l’archive officielle |
|---|---|---|
| yt-dlp macOS onedir + Python/EJS | 2026.08.19, `yt-dlp_macos.zip` | `07e54b0865303c864006925913bce2604f8ee8cc6f18699bac9c309f9328a6d8` |
| Deno arm64 | 2.9.7, `deno-aarch64-apple-darwin.zip` | `5cd46d6268f6f78f5d88bdc7159d20bd44cdaa4b3303474839f87ec6fe7ae25c` |

Les fichiers arrivent directement de leurs releases officielles sur le Mac, dans le processus d’installation déclenché par l’utilisateur. Aucun asset, miroir ou serveur Angry Thread ne transporte ces binaires dans rc2. Les redirections et empreintes sont vérifiées, aucune commande distante arbitraire n’est exécutée et aucun changement silencieux de version n’est autorisé. Les notices présentes dans l’archive sont conservées et les textes/références de licence sont accessibles.

Le bundle macOS yt-dlp conserve GPL-3.0-or-later comme travail combiné ; sa source yt-dlp seule est Unlicense. Deno conserve MIT pour son code original et ses multiples licences transitives. EJS 0.8.0 contient Meriyah 6.1.4 ISC et Astring 1.9.0 MIT. La récupération directe ne transforme aucune de ces licences. [Licence de release yt-dlp](https://github.com/yt-dlp/yt-dlp/blob/2026.08.19/README.md#licensing), [source/licence Deno exacte](https://github.com/denoland/deno/tree/v2.9.7).

Les **66 clôtures de notices Deno non établies** et la correspondance native complète du bundle PyInstaller figurent toujours dans l’audit historique rc1. Elles ne sont ni effacées ni approuvées par Henry. Elles bloqueraient une future redistribution de ces binaires par Angry Thread ; elles ne sont pas présentées comme des obligations déjà remplies du paquet hybride. Un cache de moteurs, une archive build-inputs ou un composant ajouté au DMG ferait réexaminer ce verdict avant publication.

## Police et marque

Space Grotesk 2.000 a le TTF original SHA-256 `acad6de1fc93436f5c0f1f4137751ef04f1aea3063e7036535970ffcfbd79f72` et le WOFF2 local SHA `8e085aa438094f11487a836652edd5c054fa6a96f63fc7c282105ee3a4b08c07`. La révision Google Fonts exacte est `2861cb7b12f90c0a294a12ed666e381e2211872f`. La conversion de format conserve OFL ; aucun glyphe n’a été redessiné et aucun Reserved Font Name n’est déclaré dans le copyright fourni.

Les compositions graphiques réalisées à partir des glyphes sont distinctes du logiciel de fonte et n’imposent pas OFL au code original BGDD. Les licences de la fonte et ses droits restent inchangés. Aucun transfert de marque BGDD/Angry Thread n’est déduit de la gratuité. [FAQ officielle OFL](https://openfontlicense.org/ofl-faq/).

## Verdict et garde-fous

Le modèle propriétaire est confirmé. La séparation des programmes est étayée par le code, imports et interfaces inspectés, plutôt que supposée à partir de plusieurs exécutables. Le matériau source du codec est réellement reconstructible sans source propriétaire. La candidate rc2 a été montée en lecture seule et comparée au staging : **66 fichiers d’application identiques, 23 matériaux juridiques, aucun bundle yt-dlp/Deno/Python/EJS, aucune source propriétaire ou preuve privée exposée**. Le ZIP tiers correspond exactement aux 15 fichiers codec/font approuvés, plus son inventaire. Le conteneur initial puis le conteneur mis à jour uniquement pour sa documentation ont été inspectés. Le SHA-256 du DMG actuel est `9060b3d033a64be0aaebcaaa76d5aee1d28af7543aadedc9b1827ec08435338c` ; celui du kit tiers normalisé est `d2eeefd06b1301f773cd9d55f5c06cefb2c66eb6ed5afcdb6ae4d4302b92e804`. Les 66 fichiers de l’application et les 15 matériaux du kit sont identiques à ceux du premier contrôle. Un conteneur suivant ne contenant que des changements de documentation conserve ce verdict uniquement après vérification en lecture seule de cette même application et des mêmes matériaux ; son nouveau SHA doit être enregistré.

Le [statut public de redistribution](../licenses/REDISTRIBUTION-STATUS.json) indique : **redistribution autorisée pour ce seul périmètre hybride contrôlé**, et une publication publique non autorisée à ce stade. Le snapshot de contrôle joint à l’application lors de sa fabrication précède ce verdict final ; la preuve et le statut courants de la release le complètent. Aucune conformité globale des bundles historiques n’est proclamée. La publication publique, la qualification macOS 26/27 et le parcours Gatekeeper sont des conditions distinctes que ce verdict ne remplace pas.

## Accès direct aux matériaux

Les [instructions de reconstruction](../sources/README.md), les [trois archives exactes](../sources/), la [recette réellement exécutée](../sources/build-codecs.sh), le [relevé de compilation](../sources/build-record.json) et la [méthode de remplacement local](../sources/install-codecs.pl) sont accessibles dans ce dépôt. Les textes GNU complets et la licence de la police se trouvent dans [les licences jointes](../licenses/). Le kit **BGDD-third-party-sources.zip** de la même release ajoute le TTF original de Space Grotesk ; tant que la vitrine reste privée, aucun asset n’est annoncé comme accessible publiquement.
