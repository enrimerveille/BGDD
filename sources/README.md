# Sources correspondantes des codecs BGDD rc2

Ce kit concerne uniquement **FFmpeg / ffprobe 9.0.2, x264 et LAME 3.100**, ainsi que leurs recettes indépendantes de construction et d’installation. Il ne contient aucun code Swift, TypeScript, host, gardien, sélecteur ou installateur propriétaire BGDD. Le nom BGDD identifie le build consommateur et ne change pas les droits des sources tierces.

Le programme codec distribué est GPL-2.0-or-later. Les archives conservent leurs licences d’origine : FFmpeg GPL/LGPL selon les fichiers, x264 GPL-2.0-or-later, LAME LGPL-2.0-or-later. Les deux recettes indépendantes portent leur propre en-tête GPL-2.0-or-later. Le copyright propriétaire de l’application BGDD ne leur est pas appliqué.

## Sources exactes

| Archive | SHA-256 |
|---|---|
| ffmpeg-9.0.2.tar.xz | `8c3850283eb25fa026482078a04051e0be17347b09ef81a0849bec15a96e002e` |
| x264-0480cb05.tar.gz | `be32b1e787ca8e905c10b956d2a5be0b99847deea2ff53be0cd93e488cd90323` |
| lame-3.100.tar.gz | `ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e` |

Origines : [FFmpeg 9.0.2](https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz), [x264 VideoLAN](https://code.videolan.org/videolan/x264/-/tree/0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee), [LAME 3.100](https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz). Les archives sont fournies entières, avec tous les copyrights, fichiers de configuration et recettes upstream. Aucune modification de leur code source n’a été appliquée au build de référence.

## Reconstruire

Ces étapes s’adressent aux personnes souhaitant reconstruire ou modifier les codecs. Elles ne font pas partie de l’installation normale de BGDD, qui reste graphique et ne requiert ni Terminal, ni Node, ni Python, ni Homebrew.

Le build de référence a utilisé Apple Silicon, Xcode 27 et Apple Clang 21.0.0, avec SDK 27.0 et cible minimale **macOS 26.0**. Ce minimum de compilation ne qualifie pas à lui seul le fonctionnement sur macOS 26. La recette exige un dossier de sortie vide et ne supprime aucun dossier existant.

```sh
/bin/sh ./build-codecs.sh . ./build-output
```

La recette réellement exécutée est `build-codecs.sh`. Elle vérifie les trois archives, construit x264/LAME statiques, construit FFmpeg/ffprobe avec les options enregistrées, installe les bibliothèques dans un staging et les exécutables dans `build-output/bin`. Elle génère ses SHA et la notice de configuration. Aucun module privé BGDD n’est requis pour la construction. Le préfixe `/bgdd-build` est logique et utilisé uniquement dans le staging, jamais comme dépendance de runtime.

Les encodeurs H.264, MP3, PCM, AAC, PNG et les décodeurs/parseurs disponibles dans le build sont conservés ; réseau et détection automatique de bibliothèques externes sont désactivés. `build-record.json` rapporte la recette, les trois sources, le compilateur et les empreintes des sorties avant re-signature de distribution. La re-signature ad hoc de transport change les octets et leurs SHA ; les sommes de la release distinguent cette étape.

Pour modifier LAME, x264 ou FFmpeg, décompacter la source concernée, effectuer les changements, recréer son archive et adapter dans votre copie de `build-codecs.sh` l’empreinte de l’archive modifiée. Les contrôles de SHA du build de référence sont éditables dans cette recette sous GPL ; ils ne retirent pas le droit de modifier les sources. La recette reconstruira et rééditera les liens statiques avec la bibliothèque modifiée.

## Installer des codecs reconstruits dans sa copie locale

Après avoir terminé les opérations BGDD actives, la recette indépendante suivante remplace uniquement FFmpeg/ffprobe dans une installation utilisateur identifiée et détenue par le même utilisateur :

```sh
/usr/bin/perl ./install-codecs.pl ./build-output/bin "$HOME/Library/Application Support/BGDD"
```

Cette recette utilise seulement les modules core du Perl système et les fichiers JSON locaux de l’installation. Elle prend les mêmes verrous de maintenance et de host, refuse un lien symbolique ou une installation non identifiée, conserve une sauvegarde des deux codecs et des trois métadonnées en dehors du dossier BGDD, et réenregistre les SHA de `dependencies.json`, `integrity.json` et du ledger `distribution-manifest.json`. Elle conserve le code original, les réglages, l’historique, l’identité Chrome et les médias.

Aucune clé privée, signature Developer ID ou source propriétaire BGDD n’est nécessaire pour ces changements. Aucun réglage Gatekeeper/TCC ou attribut de quarantaine n’est supprimé par cette recette. Les codecs reconstruits localement restent sous leurs licences. La vérification normale des composants peut ensuite comparer les nouvelles empreintes locales ; elle ne doit pas être présentée comme une certification du build modifié par Angry Thread.

La recette garde une sauvegarde et restaure les fichiers déjà remplacés si une erreur normale survient. Un arrêt brutal pendant le remplacement peut nécessiter une restauration volontaire depuis cette sauvegarde : ce script de source n’est pas présenté comme une transaction produit résistante à toute panne. Les opérations d’installation officielles BGDD et les tests correspondants restent distincts.

Une réparation ou mise à jour officielle peut remettre les codecs de la release d’origine. Conserver ses sources/modifications permet de les réinstaller volontairement ensuite. BGDD ne promet pas d’assistance ni de compatibilité pour des codecs modifiés, mais ses conditions ne restreignent pas l’étude, la modification, l’installation, le débogage ni la redistribution permises par les licences tierces.

## Information d’installation

La fourniture du codec de référence se place sous GPLv2, avec sa source et les scripts réellement utilisés. Le régime spécifique d’« Installation Information » de GPLv3 ne doit pas être transposé automatiquement au codec GPLv2. Les archives GPLv3 des moteurs non fournis dans le DMG sont obtenues directement par l’utilisateur auprès de leurs éditeurs et leur audit de redistribution BGDD reste historique.

La méthode de reconstruction/remplacement décrite ici est fournie concrètement, même sans prétendre qu’une exigence GPLv3 s’applique. Les SHA ne dépendent d’aucune clé détenue exclusivement par Angry Thread. LAME statique peut être remplacé et le programme utilisant cette bibliothèque peut être reconstruit avec les sources et recettes de ce kit ; aucun objet propriétaire BGDD n’est lié à LAME.
