# Sources correspondantes des codecs BGDD 0.6.4

Ce kit concerne uniquement **FFmpeg / ffprobe 9.0.2, x264, LAME 3.100 et dav1d 1.5.4**, ainsi que leurs recettes indépendantes de construction et d’installation. Il ne contient aucun code Swift, TypeScript, host, gardien, sélecteur ou installateur propriétaire BGDD. Le nom BGDD identifie le build consommateur et ne change pas les droits des sources tierces.

Le programme codec distribué est GPL-2.0-or-later. Les archives conservent leurs licences d’origine : FFmpeg GPL/LGPL selon les fichiers, x264 GPL-2.0-or-later, LAME LGPL-2.0-or-later. Les deux recettes indépendantes portent leur propre en-tête GPL-2.0-or-later. Le copyright propriétaire de l’application BGDD ne leur est pas appliqué.

## Sources exactes

| Archive | SHA-256 |
|---|---|
| ffmpeg-9.0.2.tar.xz | `8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e` |
| x264-0480cb05.tar.gz | `be32b1e787ca8e905c10b956d2a5be0b99847deea2ff53be0cd93e488cd90323` |
| dav1d-1.5.4.tar.xz | `686616b7c69eb88d44459391ab25cac13b6647a3b288835c5784e71c1514a5c5` |
| lame-3.100.tar.gz | `ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e` |

Origines : [dav1d 1.5.4](https://download.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz), [FFmpeg 9.0.2](https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz), [x264 VideoLAN](https://code.videolan.org/videolan/x264/-/tree/0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee), [LAME 3.100](https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz). Les archives sont fournies entières, avec tous les copyrights, fichiers de configuration et recettes upstream. Aucune modification de leur code source n’a été appliquée au build de référence.

## Reconstruire

Ces étapes s’adressent aux personnes souhaitant reconstruire ou modifier les codecs. Elles ne font pas partie de l’installation normale de BGDD, qui reste graphique et ne requiert ni Terminal, ni Node, ni Python, ni Homebrew.

Le **premier build local de référence, conservé comme historique**, a utilisé Apple Silicon, Xcode 27 et Apple Clang 21.0.0, avec SDK 27.0 et cible minimale **macOS 26.0**. Il ne désigne pas automatiquement le build des codecs de chaque candidate actuelle. Ce minimum de compilation ne qualifie pas à lui seul le fonctionnement sur macOS 26. La recette exige un dossier de sortie vide et ne supprime aucun dossier existant.

```sh
/bin/sh ./build-codecs.sh . ./build-output
```

La recette réellement exécutée est `build-codecs.sh`. Elle vérifie les quatre archives, construit x264/LAME/dav1d statiques, construit FFmpeg/ffprobe avec les options enregistrées, installe les bibliothèques dans un staging et les exécutables dans `build-output/bin`. Elle génère ses SHA et la notice de configuration. Aucun module privé BGDD n’est requis pour la construction. Le préfixe `/bgdd-build` est logique et utilisé uniquement dans le staging, jamais comme dépendance de runtime.

Le build active les encodeurs H.264, HEVC VideoToolbox, MP3, PCM, AAC et PNG, les décodeurs utiles dont VP9, AV1 VideoToolbox et AV1 logiciel dav1d. Le réseau et la détection automatique de bibliothèques externes sont désactivés. HEVC et AV1 matériels restent soumis aux capacités réelles du Mac. Aucun framework Apple n’est redistribué.

`build-record.json` et `FFmpeg-build.txt` décrivent la construction courante pour l’architecture du kit. `VERSIONS-<architecture>.json`, le manifeste du paquet et `SHA256SUMS` lient les sources, la recette et les exécutables après signature. Un autre compilateur ou une nouvelle signature peut produire des empreintes différentes.

La recette fonctionne nativement pour l’architecture du Mac. Pour compiler Intel depuis Apple Silicon :

```sh
/bin/sh ./build-codecs.sh . ./build-output-intel x86_64
```

La recette active les optimisations assembleur. Elle requiert Meson 1.11.2 et Ninja 1.13.2 dans PATH ; Intel requiert aussi NASM 3.01. Dav1d conserve sa licence BSD-2-Clause fournie dans ce kit. Aucun de ces outils de compilation n’est nécessaire à l’utilisateur de BGDD. Une compilation croisée ne prouve pas une exécution native Intel.

Pour modifier LAME, x264 ou FFmpeg, décompacter la source concernée, effectuer les changements, recréer son archive et adapter dans votre copie de `build-codecs.sh` l’empreinte de l’archive modifiée. Les contrôles de SHA du build de référence sont éditables dans cette recette sous GPL ; ils ne retirent pas le droit de modifier les sources. La recette reconstruira et rééditera les liens statiques avec la bibliothèque modifiée.

## Installer des codecs reconstruits dans sa copie locale

Après avoir terminé les opérations BGDD actives, la recette indépendante suivante remplace uniquement FFmpeg/ffprobe dans une installation utilisateur identifiée et détenue par le même utilisateur :

```sh
/usr/bin/perl ./install-codecs.pl ./build-output/bin "$HOME/Library/Application Support/BGDD"
```

Cette recette pour la disposition `engine-app-v2` utilise les outils système et les modules core du Perl. Elle verrouille la maintenance et le host, vérifie l'identité et l'intégrité de l'installation, prépare une nouvelle enveloppe du moteur puis remplace FFmpeg/ffprobe dans `BGDD Engine.app/Contents/MacOS`. Elle renouvelle le sceau ad hoc de l'enveloppe et les empreintes locales. Le code fonctionnel original et les signatures des autres composants restent conservés ; les octets de signature de l'entrée du moteur changent avec son sceau de ressources.

La sauvegarde extérieure conserve l'application originale entière et les trois métadonnées. Les préférences, l'historique, l'identité Chrome et les médias restent à leur place. Le remplacement et son acceptation par le vérificateur de production rc4 ont été testés dans une installation isolée. Cela n'est pas une qualification Gatekeeper d'un codec modifié par vous.

Aucune clé privée, identité Apple ni source propriétaire n'est requise. La nouvelle enveloppe et la nouvelle entrée reçoivent une quarantaine ordinaire sans autorisation ; une autorisation attachée à l'ancien code n'est pas recopiée sur le code remplacé. Les codecs conservent la quarantaine de leur source ; un codec construit localement sans cet attribut reçoit également une quarantaine ordinaire. Aucun attribut de l'original sauvegardé ni réglage Gatekeeper/TCC n'est supprimé. Une nouvelle décision humaine d'ouverture peut être nécessaire dans Réglages Système. Les nouvelles empreintes sont locales : elles ne certifient pas le build modifié au nom d'Angry Thread.

Une erreur normale pendant l'adoption restaure les fichiers déplacés. Un arrêt brutal peut nécessiter une restauration volontaire depuis la sauvegarde ; ce script de source ne constitue pas une transaction produit résistante à toute panne. Les relevés de transfert de l'installation d'origine restent des preuves historiques, et non une preuve du remplacement.

Une réparation ou mise à jour officielle peut remettre les codecs de la release d’origine. Conserver ses sources/modifications permet de les réinstaller volontairement ensuite. BGDD ne promet pas d’assistance ni de compatibilité pour des codecs modifiés, mais ses conditions ne restreignent pas l’étude, la modification, l’installation, le débogage ni la redistribution permises par les licences tierces.

## Information d’installation

La fourniture du codec de référence se place sous GPLv2, avec sa source et les scripts réellement utilisés. Le régime spécifique d’« Installation Information » de GPLv3 ne doit pas être transposé automatiquement au codec GPLv2. Les archives GPLv3 des moteurs non fournis dans le DMG sont obtenues directement par l’utilisateur auprès de leurs éditeurs et leur audit de redistribution BGDD reste historique.

La méthode de reconstruction/remplacement décrite ici est fournie concrètement, même sans prétendre qu’une exigence GPLv3 s’applique. Les SHA ne dépendent d’aucune clé détenue exclusivement par Angry Thread. LAME statique peut être remplacé et le programme utilisant cette bibliothèque peut être reconstruit avec les sources et recettes de ce kit ; aucun objet propriétaire BGDD n’est lié à LAME.
