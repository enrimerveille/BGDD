# Distribution 0.4.8-rc.3 — Validation

La candidate gratuite propriétaire cible **macOS 26 et 27 Apple Silicon**. Le run rc3 **38305324669** réussit sur les deux systèmes : installation officielle, outils natifs, intégrité, remplacement GPL, maintenance, cinq recettes codec et sept contrôles Chrome par OS. La compatibilité native26 est **validée virtuellement dans ces périmètres** ; cette preuve est acceptée sans exiger un Mac physique, un compte macOS neuf ou une VM locale. Les essais média réseau n’étaient pas demandés dans ce run. La nouvelle séquence graphique **Ouvrir le moteur** reste **UNKNOWN / non qualifiée** après deux recettes AppKit en échec, sans modification du produit ni cause moteur ou Gatekeeper établie. Gatekeeper manuel n’est pas qualifié. Les dépôts restent privés et aucune publication publique n’est autorisée.

## Résultats rc3 mesurés

| Périmètre | Résultat | Limite |
|---|---|---|
| Identité du produit | Extension 0.4.8, host 0.3.4, protocole 2 ; sources originales non publiées | Les outils de recette restent distincts du produit livré |
| macOS26 | macOS26.6.2 arm64, Xcode26.6, SDK26.5, Swift6.3.3 : build et recettes natives PASS | Runner virtuel ; résultat limité aux opérations effectivement exécutées |
| macOS27 | macOS27.0.1 arm64, Xcode27.0, SDK27.0, Swift6.4 : build et recettes natives PASS | Sa candidate est construite avec SDK27 ; aucune identité d’octets avec le build SDK26 n’est supposée |
| Paquet et installation | 68 fichiers dans chaque app installateur, sept Mach-O transportés ; 112 Mach-O inspectés après acquisition ; Engine assemblé avec 22 alias internes et seal vérifié | Les moteurs upstream restent acquis directement, hors du DMG ; la signature ad hoc n’identifie pas l’éditeur auprès d’Apple |
| Maintenance et droits GNU | Bootstrap officiel, diagnostic natif, EOF, outils, remplacement des codecs via recette indépendante accepté par le Core de production, mise à jour et désinstallation PASS sur les deux OS | HOME de recette marqué ; aucune décision Gatekeeper humaine déduite |
| Codecs | 5/5 recettes par OS : remux, MP4 H.264/AAC, WAV24, MP3 320k et carrousel synthétique | Médias locaux ; codecs de chaque build testés sur son OS, aucun téléchargement plateforme demandé |
| Mêmes codecs SDK26 | Run38306418100 : les mêmes SHA FFmpeg/ffprobe du DMG SDK26 passent5/5 recettes sur26 et5/5 sur27, sans reconstruction | Recette locale de médias ; quarantaine absente dans ce trajet d’artefact CI, aucune ouverture humaine déduite |
| Chrome | 7/7 contrôles par OS : identité, Native Messaging, état initial vide, conservation après mise à jour/relance, refus d’origine, fermeture et désinstallation | Profil neuf sans compte ; Chrome152.0.7977.82 sur26 et154.0.8037.92 sur27, en mode headless |
| Réseau média | Non demandé, liste des essais vide | Ce n’est ni un succès réseau ni un nouvel échec ; les challenges rc2 restent historiques |
| Conformité du paquet | Audit exact externe PASS : 68 fichiers app, 23 matériaux juridiques, kit tiers15, runtime upstream et sources originales exclus ; remplacement GPL réel PASS | Verdict lié aux empreintes exactes ; aucune autorisation publique ou approbation Apple |
| Fenêtre installateur SDK26 | Vraie fenêtre observée en lecture seule surmacOS27 : baseline, phrase exacte et bouton Ouvrir le moteur présents ; cinq empreintes personnelles inchangées | Aucun bouton d’installation ou de moteur actionné ; ni première ouverture distante quarantinée ni installation graphique complète |
| Séquence AppKit rc3 | Runs38306418290 et38308922236 FAIL ; dernier run échoué sur26/27, qualification actuelle UNKNOWN | Compilation/helpers/bootstrap passent, mais aucune ouverture liée par callback ou événement NSWorkspace vérifié ; statut final UI non observé, sans cause moteur ou Gatekeeper inférée |
| Suite portable finale | 360 tests,360 PASS,0 échec ou test ignoré | Tests automatisés, distincts de la préparation AppKit et des décisions humaines |

Le DMG SDK26 examiné fait **35 285 476 octets**, SHA-256 `37646892247ed5e2812e5c600987b9ca0e43465622949859fa7346c469f487c4`. Le kit tiers fait **14 728 156 octets**, SHA-256 `5282ee5ab7d20d0b3400ca56c9e15d6617c6b13cec0b3b07683e919e2929f0ad`. Ces références identifient les conteneurs de ce run ; un rafraîchissement documentaire ultérieur nécessite ses propres empreintes et contrôles.

La recette AppKit dédiée visait l’ouverture réelle et la séquence yt-dlp → FFmpeg → ffprobe, sans média ni Chrome, avec le wrapper SDK26 candidat et des helpers de recette distincts. Dans le dernier run, compilation, helpers et bootstrap passent, mais aucun callback ni événement NSWorkspace vérifié ne lie l’ouverture à la requête. Le statut final de l’interface reste **UNKNOWN**. Un processus transloqué est présent ; cette présence seule ne prouve pas l’ouverture liée ni la réussite de la séquence. Le nettoyage a été retenu par la garde fermée, sans inférer une fin de processus ou effacer une zone encore ambiguë. Aucun agent n’accorde de permission Gatekeeper/TCC, ne retire la quarantaine ou ne change la confiance système. Ces observations n’établissent ni défaut du produit ni refus Gatekeeper.

Les deux premiers runs rc3 restent en échec historique : typechecking SDK26, puis seed plat reconnu comme bundle lors de sa signature. Les corrections et le run réussi ne modifient pas leurs résultats. L’assemblage local SDK27/cible26 de 135 fichiers Engine et22 alias avait réussi sans lancer les moteurs ni l’interface ; cette preuve reste distincte de la CI et de la future recette graphique.

## Preuves séparées — historique rc2

| Périmètre | Résultat observé | Limite |
|---|---|---|
| Non-régression | 357/357 tests existants ; TypeScript et build réussis | Tests automatisés, distincts des essais réseau et des autorisations humaines |
| Installateur et mise à jour | 86/86 contrôles de maintenance, versions, origines et transactions | Fixtures et HOME isolés ; aucune autorisation Gatekeeper humaine déduite |
| Bootstrap et sécurité | 44/44 contrôles des pins, archives ZIP, chemins, liens et quarantaine | Vraies archives officielles et entrées malveillantes ; ni version ni empreinte assouplie |
| Packaging et vitrine | 8/8 contrôles du paquet ; 2/2 contrôles du refus de sources originales, secrets, liens et historique | Audit des fichiers réellement suivis et des blobs historiques ; aucun scanner externe revendiqué |
| macOS 26 natif | macOS 26.6.2 arm64, Xcode 26.6, SDK 26.5, Swift 6.3.3 : build et installation réelle isolée réussis | Recette automatisée ; pas de compte macOS neuf ni de parcours graphique complet |
| macOS 27 natif | macOS 27.0.1 arm64, Xcode 27.0, SDK 27.0, Swift 6.4 : mêmes recettes réussies | Même limite ; les preuves historiques rc.1 restent distinctes |
| Acquisition des moteurs | Trois cycles réels de bootstrap officiel par OS ; versions, empreintes et quarantaine contrôlées | Les premiers incidents locaux HTTP504 et délai dépassé restent consignés séparément |
| Composants installés | 111 Mach-O inspectés après acquisition ; six exécutables transportés arm64, minimum26.0 ; signatures techniques et imports contrôlés | L’inspection ne remplace pas l’exécution ; signature ad hoc sans identité Apple |
| Maintenance native | Installation déplacée, diagnostic encadré, sortie EOF, outils réels, remplacement GPL reconstruit, mise à jour, désinstallation et réinstallation réussis sur les deux OS | Préférences, historique et médias conservés ; pas une preuve Gatekeeper graphique |
| Chrome vierge | Profil isolé, identité exacte, destination isolée, Native Messaging réel, reprise après mise à jour, refus d’origine incorrecte et fermeture sans processus de recette restant : sept contrôles réussis par OS | Chrome automatisé sans compte ; panneaux AppKit et actions Finder non qualifiés par cette recette |
| YouTube public — recettes rc.2 | Qualité maximale, MP4, WAV et MP3 : huit tentatives au total, toutes unavailable, code challenge | « Vérification demandée par YouTube. » ; zéro format ni annulation qualifiés par ces recettes ; le prototype privé ci-dessous est distinct |
| Codecs de la candidate SDK26 | 5/5 recettes réussies sur chaque OS avec les mêmes FFmpeg/ffprobe : remux, MP4 H.264/AAC, WAV24 PCM identique, MP3 320k et carrousel 3 images | Médias locaux de recette ; MP4 issu d’une source synthétique déclarée, pas une conversion AV1 silencieuse ni un téléchargement public |
| Interface locale macOS27 | Installation graphique réelle dans un HOME marqué, vérification des fichiers et préparation du dossier Chrome réussies ; alignement BGDD/signature et nouvelle phrase vérifiés visuellement | Variante de recette locale SDK27 ; aucune modification de l’installation personnelle |
| Gatekeeper manuel local | Refus initial du host observé ; après autorisation personnelle, diagnostic Chrome natif réussi. Autorisation du gardien confirmée par l’utilisateur ; NSOpenPanel ouvert depuis Chrome, choix enregistré et annulation conservant la destination réussis | Variante locale SDK27 ; aucun parcours complet de la candidate distante finale sur26/27 déclaré |
| Réseau local historique macOS27 | Deux MAX avant Engine.app échouent : yt-dlp137 puis Python255 | Variante SDK27 historique ; échecs conservés, sans attribution à la phase Engine.app suivante |
| Prototype privé Engine.app/Chrome | Quatre formats Coffee Run vérifiés, annulation après 1 024 octets, sortie origine64 et fermeture/intégrité PASS, zéro processus de recette | Host SDK27 instrumenté, vrai RPC popup/worker, page de métadonnées synthétique et média natif public ; ni clic du bouton Télécharger ni candidate SDK26 qualifiés |
| Licences | 23 matériaux transportés, kit de 15 fichiers tiers, reconstruction indépendante et remplacement réellement exécutés | Conformité limitée à l’architecture hybride et aux matériaux examinés ; aucune approbation Apple ou publication publique déduite |

Les pages synthétiques servent uniquement aux métadonnées et captures. Les essais YouTube passent par l’extension, son worker et le host réels, sans cookies ni compte personnel. Un état unavailable, auth ou interrupted ne vaut jamais succès. Les échecs des recettes canoniques conservent leurs workflows de distribution en échec ; un PASS du prototype ne change pas leur résultat historique.

## Trajet privé Engine.app/Chrome — phase finale PASS du 12 octobre

La preuve finale clôt seulement le clone SDK27 instrumenté. Le véritable `popup.html` appelle son worker inchangé et le host privé résout yt-dlp vers l’application Engine déjà ouverte par l’utilisateur. La page de métadonnées est synthétique ; les médias de Coffee Run sont demandés au réseau public par les outils natifs. Aucun cookie, compte ou Chrome personnel n’est utilisé ; le HOME du compte est hérité volontairement par le Chrome privé, ses profil/destination et l’état natif restent isolés. Le clic du bouton Télécharger n’est pas qualifié.

| Sortie vérifiée | Codecs observés | Taille |
|---|---|---|
| MAX MKV | AV1 2048×858 et Opus stéréo 48 kHz | 30 401 647 octets |
| MP4 | H.264 1920×804 et AAC stéréo 44,1 kHz | 44 348 362 octets |
| WAV | PCM24 stéréo 44,1 kHz | 48 869 612 octets |
| MP3 | MP3 320 kb/s, stéréo 44,1 kHz | 7 390 755 octets |

Les fichiers sont vérifiés par ffprobe et SHA dans la destination privée. L’annulation d’un MAX supplémentaire intervient après 1 024 octets reçus ; le groupe natif s’arrête et les quatre médias précédents restent inchangés. La mauvaise origine native est refusée par sortie 64. EOF ferme le seul Chrome de recette : intégrité finale PASS et zéro processus de recette restant. Les cinq empreintes personnelles finales sont identiques.

La chronologie reste conservée : premier MAX sans fusion FFmpeg, refus du pilote sur les bookmark/UUID créés normalement par le host, puis deuxième MAX refusé au stade ffprobe 137. Le receipt repris garde ces deux tentatives échouées et le troisième MAX réussi. L’utilisateur confirme séparément les deux ouvertures Engine.app, le nouveau host, FFmpeg et FFprobe ; les acteurs des autres autorisations historiques restent UNKNOWN. Le contrôle initial stdout/version yt-dlp ne constitue pas une qualification indépendante EJS.

Au terme de cette phase historique, la proposition de production de six fichiers était encore du scratch : typechecks et 153 contrôles de disposition, flags explicites, sans app assemblée/exécutée ni nouvelle installation. Les mesures rc3 ultérieures sont décrites séparément ci-dessus. La candidate rc.2 SDK26, ses66 fichiers et ses cinq assets restent inchangés ; aucun succès du prototype ne leur est transféré. Cette phase privée du prototype ne qualifie ni macOS26 ni un état de confiance vierge et ne publie rien.

## Candidate rc2 — provenance historique

La candidate retenue utilise l’application compilée dans la recette macOS26, SDK26.5. Les 66 fichiers de cette application sont conservés lors des rafraîchissements documentaires du DMG. Les inventaires, sources de codecs, instructions de reconstruction et empreintes distinguent les anciens builds locaux des exécutables réellement transportés.

Le DMG hybride contient BGDD, FFmpeg/ffprobe, les polices et leurs matériaux exigés. yt-dlp et Deno sont acquis directement depuis leurs releases officielles lors de l’installation explicite, avec versions et empreintes fixées. Leur archive et leur runtime ne sont pas redistribués dans le DMG.

## Gatekeeper et systèmes restant à qualifier

Le parcours Gatekeeper complet de la candidate rc3 téléchargée à distance reste non qualifié. Sur le Mac disponible, il doit couvrir, quarantaine conservée : première ouverture, autorisation humaine, auxiliaires et moteurs, téléchargement autorisé, fermeture/réouverture et désinstallation. Une exception accordée à un seul exécutable ne qualifie pas les autres. Les refus Python de l’ancienne disposition restent observés et conservés ; la signature ad hoc seule n’établit pas une permission de lancement. Le layout de production rc3 et son intégrité passent désormais les recettes natives, mais la préparation AppKit réelle reste non qualifiée après l’échec de sa recette ; elle ne vaut pas une décision Gatekeeper humaine.

Aucune VM locale n’est utilisée. Les recettes distantes sont automatisées et leur validation native26 est acceptée dans son scope, sans exigence de Mac physique26 ou de compte macOS neuf. L’interface et les autorisations Gatekeeper graphiques26 n’ont pas été observées ; cette absence reste une limite documentée, sans nouvelle demande de matériel. Les recettes locales conservent leurs HOME et profils isolés. Le parcours exact du paquet final reste distinct des variantes de recette.

## Historique et périmètre

rc.1 est conservée avec son DMG, son tag, ses sources et ses preuves. Ses 350 tests, quatre transferts YouTube, annulation native, Finder et recette macOS27 ne sont pas réattribués à rc.2. Les réserves juridiques de son ancien bundle autonome restent historiques et ouvertes.

Aucun Intel, nouvel essai public X/Instagram/TikTok, écoute humaine, VoiceOver humain ou nouveau test matériel APFS/exFAT n’est revendiqué. L’installation personnelle et le Chrome personnel restent hors recette.

## État de publication

- **Préparé techniquement :** rc3 construite ; installation, outils, maintenance, codecs et Chrome démontrés dans les scopes ci-dessus. Séquence AppKit réelle UNKNOWN / non qualifiée après les deux runs FAIL conservés.
- **Conforme pour distribution :** verdict exact du paquet hybride rc3 et de ses sources correspondantes établi pour les empreintes examinées ; l’état inputs scellé reste volontairement distinct.
- **Prêt à publier : non.** Préparation graphique réelle et parcours Gatekeeper final restent à qualifier ; aucun résultat média réseau rc3 n’est revendiqué. La validation native26 virtuelle est acceptée ; aucun Mac physique26, compte macOS neuf ou VM locale n’est exigé.
- **Public : non.** Dépôts privés ; publication conditionnée à une validation terminée et à l’accord final explicite de l’éditeur.

## Conteneur documentaire final

Le dernier DMG revalidé après mise à jour de la documentation fait **35 233 766 octets**, SHA-256 `49e08ae7235f3474648d0de78441d30858fbdef3f4fd32df463cacbe08307bf7`. Les **68 fichiers de l’app SDK26 restent identiques**. Le kit tiers reste **14 728 156 octets**, SHA-256 `5282ee5ab7d20d0b3400ca56c9e15d6617c6b13cec0b3b07683e919e2929f0ad`. Les empreintes du run initial ci-dessus restent des références historiques ; ce rafraîchissement ne modifie ni le produit ni l’état AppKit **UNKNOWN / non qualifié**, et n’accorde aucune permission de publication publique.
