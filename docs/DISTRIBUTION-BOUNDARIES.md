# BGDD rc3 — frontières entre programmes

## Périmètre actuel rc3

La candidate 0.4.8-rc.3 conserve le téléchargement officiel direct de yt-dlp/Python/EJS et de Deno. Après acquisition sur le Mac utilisateur, l’installateur assemble **BGDD Engine.app** : le lanceur original utilise les commandes publiques de version et lance yt-dlp comme programme distinct ; il n’importe ni ne lie son runtime Python. La disposition et la signature techniques ne changent pas les licences des composants tiers. FFmpeg/ffprobe restent des exécutables séparés hors de ce bundle scellé, avec reconstruction et remplacement GPL vérifiés par le cœur de maintenance rc3.

L’app installateur rc3 de 68 fichiers, les 23 matériaux et le kit tiers de 15 fichiers ont fait l’objet d’un nouveau contrôle exact. Les références rc2 et application66 dans le détail ci-dessous restent historiques ; elles ne constituent pas ce verdict rc3. Les deux recettes AppKit du harnais ont échoué ; la préparation graphique du moteur reste UNKNOWN / non qualifiée. Aucune cause moteur ou Gatekeeper n’est déduite et aucune nouvelle tentative n’est prévue. [Verdict actuel](DISTRIBUTION-LICENSES.md), [validation](DISTRIBUTION-VALIDATION.md).

## Analyse et matériaux historiques conservés

12 octobre 2026 · modèle confirmé : **logiciel original gratuit et propriétaire, Angry Thread**. Cette analyse porte sur l’architecture inspectée et sur la stratégie rc2. Elle ne requalifie pas l’ancien paquet autonome rc1 comme conforme.

## Conclusion opérationnelle

La séparation du code original BGDD et des programmes tiers est **défendable au regard des mécanismes et échanges observés** : aucun code GPL identifié dans les sources originales, aucun lien avec les bibliothèques média dans le host, et utilisation des interfaces publiques de programmes indépendants. La qualification juridique ne dépend pas uniquement du nombre d’exécutables ; elle dépend aussi de ce qui est échangé. L’inférence ci-dessous doit être réévaluée si cette architecture change. [Critères exposés par la FSF](https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#MereAggregation).

Une seule stratégie est retenue : **DMG hybride**. Il fournit BGDD et ses deux exécutables codec FFmpeg/ffprobe, accompagnés des sources exactes x264/LAME/FFmpeg et de la recette indépendante réellement exécutée. Il ne fournit pas les binaires yt-dlp, Python, EJS ou Deno : l’utilisateur déclenche leur récupération directe auprès des releases officielles, avec versions et SHA-256 fixes.

Cette stratégie réduit le périmètre de redistribution pris en charge par Angry Thread. Elle ne transforme pas les licences des composants récupérés et ne constitue pas une clôture de l’ancien audit des bundles. Le paquet et les assets doivent effectivement respecter cette frontière ; une copie de ces moteurs dans le DMG, une archive de dépendances livrée ou un miroir BGDD réintroduirait leur redistribution.

## Architecture réellement inspectée

| Frontière | Mécanisme observé | Nature des échanges | Conséquence pour le périmètre |
|---|---|---|---|
| Chrome ↔ host BGDD | Native Messaging, protocole 2 | Commandes BGDD, états, préférences et métadonnées bornées | Deux parties du produit original BGDD ; aucun runtime GPL chargé dans Chrome |
| Host ↔ gardien BGDD | `posix_spawn`, arguments et groupe de processus | Lancement, surveillance du parent, arrêt du groupe | Gardien original, appels POSIX système ; pas de bibliothèque média liée |
| Host ↔ yt-dlp | Exécutable séparé, CLI documentée | URL canonique ; `--dump-single-json`, `--load-info-json`, formats, fichiers JSON/media, progression et noms de fichiers | Outil indépendant ; pas de plugin BGDD ni appel de fonctions Python embarquées |
| yt-dlp ↔ Deno/EJS | Interface officielle de yt-dlp au runtime JavaScript ; EJS du bundle officiel | Résolution JavaScript propre au moteur | Composition des moteurs amont ; aucun code propriétaire BGDD chargé comme module dans EJS/Deno |
| Host ↔ FFmpeg | Exécutable séparé, CLI | Médias ordinaires, options de codec/format, progression sur stdout | Pas de `libavcodec`, `libavformat`, x264 ou LAME lié au host |
| Host ↔ ffprobe | Exécutable séparé, CLI | Fichier média et résultats JSON `-of json` | Résultats d’analyse via une interface publique ; pas de structure C partagée |
| FFmpeg/ffprobe ↔ x264/LAME | Liens **statiques** dans le build codec | Appels aux bibliothèques à l’intérieur du programme FFmpeg | Le build codec est GPL, avec les obligations propres de LAME ; cette liaison est réellement présente et déclarée |
| Host ↔ sélecteur BGDD | Application AppKit ponctuelle, résultat JSON | Dossier choisi ou annulation | Partie originale BGDD ; frameworks Apple système |

Les préfixes `BGDD_PROGRESS` et `BGDD_FILE` sont des gabarits de sortie demandés par les options publiques de yt-dlp. Ils ne constituent pas un plugin injecté dans le moteur. Le host lit et restreint les informations de formats avant de les remettre à `--load-info-json` : c’est une représentation publique sérialisée des métadonnées, sans pointeur, objet Python partagé, callback d’ABI ou accès à une structure mémoire interne.

La fermeture du port et l’annulation arrêtent un groupe de processus. Ces contrôles de cycle de vie n’intègrent pas le code source des programmes arrêtés dans BGDD. Le mode de qualité et les conversions sont des options CLI. Le moteur FFmpeg peut fonctionner indépendamment ; ses sources et sa recette permettent de le reconstruire et de le réutiliser séparément.

## Vérification des incorporations et des liens

Les imports TypeScript des entrées de l’extension se résolvent vers les modules locaux BGDD. Aucun paquet npm runtime ni fragment GPL incorporé n’a été identifié dans le code de l’application. esbuild et TypeScript sont des outils de construction privés ; aucun framework client supplémentaire n’est ajouté.

Les sources Swift importent Foundation, AppKit, CryptoKit, Darwin, ImageIO et UniformTypeIdentifiers ; le gardien C utilise les en-têtes POSIX du système. Aucune inclusion `libav`, `libx264`, `libmp3lame`, Python ou Deno, aucun `dlopen` de ces bibliothèques et aucune extension Python/JavaScript propriétaire chargée dans le moteur n’ont été identifiés.

Le contrôle des importations Mach-O du host, du gardien et de l’installateur confirme des bibliothèques et frameworks système Apple et le runtime Swift système. Le contrôle porte sur les binaires inspectés ; ces références historiques ne qualifient pas une candidate ultérieure. Dans les binaires FFmpeg/ffprobe, x264 et LAME sont statiques et les dépendances dynamiques restantes sont macOS système.

Les sources exactes codec sont celles des archives épinglées. Leur code n’est pas recopié dans les sources du host. Aucune bibliothèque nonfree n’est activée. Les encodeurs et filtres utiles ne sont pas retirés pour modifier le régime de licence.

## Analyse juridique et limites

La GPLv2 distingue l’agrégation de programmes indépendants d’un programme dérivé combiné. Le simple voisinage sur un même disque n’étend pas automatiquement la GPL à tout autre code ; inversement, séparer artificiellement une œuvre combinée en fichiers ne change pas son régime. La FSF examine aussi la sémantique de communication : un échange de structures internes intimes peut remettre en cause la séparation. [GPLv2, section 2](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section2), [analyse FSF des communications](https://www.gnu.org/licenses/gpl-faq.en.html#MereAggregation).

**Inférence pour BGDD** : les médias, JSON et commandes publics observés constituent les entrées/sorties ordinaires des outils, et pas une interface de fonctions internes ou un espace mémoire partagé. Les programmes conservent leurs formats et fonctionnalités autonomes. Aucun obstacle technique démontré n’oblige à publier le code original BGDD sous GPL dans cette architecture. Ce verdict est une analyse du périmètre constaté, pas une décision de tribunal ni une certification de tous les droits privés.

Le bundle PyInstaller yt-dlp reste un travail combiné GPLv3+ selon son propre éditeur, indépendamment de la licence Unlicense de la source yt-dlp. Son utilisation privée n’est pas une renonciation aux licences et ne modifie pas les droits de ses auteurs. Le composant est obtenu auprès de l’amont par l’utilisateur, sans être fourni par Angry Thread dans rc2. [Conditions de la release exacte yt-dlp](https://github.com/yt-dlp/yt-dlp/blob/2026.08.19/README.md#licensing), [GPLv3, permissions de base](https://www.gnu.org/licenses/gpl-3.0.en.html#section2).

Le copyright propriétaire et les conditions BGDD excluent expressément les tiers et les sources correspondantes des codecs. Ils ne leur imposent pas de restriction contraire aux licences GNU ou OFL. Les utilisateurs gardent leurs droits sur les tiers, même lorsque BGDD contrôle l’intégrité de sa configuration d’origine.

## Pourquoi la fourniture directe est retenue

| Critère | DMG autonome rc1 | DMG hybride rc2 retenu |
|---|---|---|
| Conformité prise en charge par Angry Thread | Tous les moteurs redistribués ; clôture source/notices yt-dlp/Deno encore ouverte | Codec redistribué et source/recette maîtrisées ; yt-dlp/Deno obtenus directement depuis leurs éditeurs |
| Taille | Moteurs et vaste matériau de sources/notices dans le DMG | DMG réduit ; deux archives moteur téléchargées à l’installation |
| Simplicité | Installation offline après récupération du paquet | Une action dans le même installateur ; connexion nécessaire pour les moteurs |
| Fiabilité | Archive complète disponible même si l’amont est indisponible | Une indisponibilité amont empêche une première installation/réparation ; erreur et réessai explicites |
| Maintenance | Chaque nouveau bundle requiert son audit de redistribution complet | Versions verrouillées ; changement uniquement par candidate explicitement mise à jour |
| Sécurité | Intégrité du conteneur puis de tous les composants | Intégrité du conteneur et validation distincte de chaque archive officielle avant installation |
| Temps | Téléchargement initial plus lourd | Téléchargements réels affichés pendant l’installation ; pas de délai ou pourcentage fictif |

La récupération directe est une frontière de fourniture concrète : HTTPS, URLs de release exactes, hôtes/redirections autorisés, versions fixes, SHA-256 épinglés et extraction confinée. Aucun script distant n’est exécuté. Le logiciel ne choisit pas silencieusement une « dernière version ». Les notices d’origine de l’archive sont conservées et les références de licences restent accessibles.

L’absence de notarisation ou de Developer ID est une limite d’authenticité distincte. Les empreintes vérifient les octets attendus ; elles ne prouvent pas l’identité Apple de l’éditeur. L’utilisateur conserve le choix d’autorisation officielle de macOS. Cette décision n’autorise aucune suppression automatique de quarantaine.

## Sources correspondantes du codec fourni

GPLv2 exige la source correspondante complète et les scripts utilisés pour contrôler la compilation et l’installation des exécutables. Des archives upstream sans la recette réellement utilisée ne suffisent donc pas à notre clôture. [GPLv2, section 3](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section3).

`build-codecs.sh` est une recette indépendante, diffusée sous GPL-2.0-or-later uniquement comme matériau du kit codec. Elle compile les trois sources sans importer les modules privés BGDD, installe les bibliothèques dans un staging privé et place FFmpeg/ffprobe dans le répertoire `bin` construit. Le premier pipeline local rc2 l’a réellement exécutée ; [le relevé historique](../sources/build-record.json) conserve sa construction Clang 21.0.0/SDK 27.0. Les candidates ultérieures SDK26 exécutent la même recette et les mêmes archives/options ; `VERSIONS.json.media` de chaque release consigne leur propre compilateur, SDK et sorties avant signature. Les empreintes du payload identifient les codecs après signature. Le conteneur rc2 et les sources ont ensuite été comparés aux matériaux approuvés, avec une identité complète des 66 fichiers de l’application et des 15 fichiers du kit tiers.

L’installateur graphique BGDD copie et transporte les fichiers déjà construits ; il ne compile ni ne lie les codecs au code propriétaire. La FAQ GNU traite explicitement l’installateur et les fichiers qu’il installe comme des œuvres séparées : cela n’impose pas une licence GPL à l’installateur indépendant. Les scripts propres à la compilation et à l’installation du codec restent, eux, fournis dans le kit et réellement exécutés. [FAQ GNU sur l’installateur](https://www.gnu.org/licenses/old-licenses/gpl-2.0-faq.html#GPLCompatInstaller).

Ce kit n’expose aucune source Swift, TypeScript ou intégration propriétaire. Les frameworks/bibliothèques macOS et le compilateur ne sont pas copiés dans le produit ; leur situation est distincte de celle des trois sources statiques effectivement fournies. La recette et les archives permettent de reconstruire FFmpeg avec une version modifiée de LAME ou de x264, sous leurs conditions.

## Propriété et contributions originales

L’éditeur Angry Thread retient explicitement le modèle propriétaire gratuit. Le dépôt privé de préparation contient une seule identité d’auteur de commit, Angry Thread, et commence par un snapshot de distribution. Aucune contribution externe ou copie de source GPL n’a été identifiée dans les sources originales examinées. Les relevés internes de droits et de source propriétaire ne sont pas publiés dans cette vitrine.

Un nom d’auteur Git ne prouve pas à lui seul une cession de droits ; les contrats de travail, licences de contributions antérieures ou autres accords non fournis ne peuvent pas être établis par un scan. Les mentions portent donc sur les éléments originaux protégeables détenus par Angry Thread, sans s’attribuer les tiers ni les fragments non protégeables. Aucune prétention nouvelle de propriété exclusive sur Space Grotesk ou les outils n’est introduite.

Toute contribution tierce future, import de code, plugin, liaison de bibliothèque ou modification profonde de l’IPC doit être examinée avant d’entrer dans une release. Les réserves rc1 de Deno et du bundle yt-dlp restent historiques et ouvertes pour une éventuelle future redistribution de leurs binaires.
