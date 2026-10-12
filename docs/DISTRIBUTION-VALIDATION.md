# Distribution 0.4.8-rc.2 — Validation

La candidate gratuite propriétaire cible **macOS 26 et 27 Apple Silicon**. Les deux systèmes ont réellement exécuté les recettes privées. L’installation, les outils et Native Messaging passent ; les quatre téléchargements publics demandés échouent sur une vérification YouTube. La compatibilité native sous26 est **validée virtuellement dans les périmètres réussis** ; Henry accepte cette preuve sans imposer un Mac physique. Les essais réseau et le parcours Gatekeeper complet de la candidate finale restent distincts et non qualifiés. Les deux dépôts restent privés et aucune publication publique n’est autorisée.

## Preuves séparées

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
| YouTube public | Qualité maximale, MP4, WAV et MP3 : huit tentatives au total, toutes unavailable, code challenge | « Vérification demandée par YouTube. » ; zéro format réseau qualifié, aucune annulation de transfert actif démontrée |
| Codecs de la candidate SDK26 | 5/5 recettes réussies sur chaque OS avec les mêmes FFmpeg/ffprobe : remux, MP4 H.264/AAC, WAV24 PCM identique, MP3 320k et carrousel 3 images | Médias locaux de recette ; MP4 issu d’une source synthétique déclarée, pas une conversion AV1 silencieuse ni un téléchargement public |
| Interface locale macOS27 | Installation graphique réelle dans un HOME marqué, vérification des fichiers et préparation du dossier Chrome réussies ; alignement BGDD/signature et nouvelle phrase vérifiés visuellement | Variante de recette locale SDK27 ; aucune modification de l’installation personnelle |
| Gatekeeper manuel local | Refus initial du host observé ; après autorisation personnelle, diagnostic Chrome natif réussi. Autorisation du gardien confirmée par l’utilisateur ; NSOpenPanel ouvert depuis Chrome, choix enregistré et annulation conservant la destination réussis | Variante locale SDK27 ; aucun parcours complet de la candidate distante finale sur26/27 déclaré |
| Réseau local macOS27 | Deux tentatives MAX via le popup et le host installés échouent : sortie137 après refus Gatekeeper de yt-dlp, puis sortie255 après autorisation d’exécution de yt-dlp mais refus de chargement de sa bibliothèque Python | Variante SDK27 ; métadonnées synthétiques, média natif public. MP4/WAV/MP3 et annulation active non testés après ces refus. Aucun bouton d’exception actuellement observé, aucune protection modifiée |
| Licences | 23 matériaux transportés, kit de 15 fichiers tiers, reconstruction indépendante et remplacement réellement exécutés | Conformité limitée à l’architecture hybride et aux matériaux examinés ; aucune approbation Apple ou publication publique déduite |

Les pages synthétiques servent uniquement aux métadonnées et captures. Les essais YouTube passent par l’extension, son worker et le host réels, sans cookies ni compte personnel. Un état unavailable, auth ou interrupted ne vaut jamais succès. Les échecs réseau conservent les workflows de distribution en échec.

## Candidate et provenance

La candidate retenue utilise l’application compilée dans la recette macOS26, SDK26.5. Les 66 fichiers de cette application sont conservés lors des rafraîchissements documentaires du DMG. Les inventaires, sources de codecs, instructions de reconstruction et empreintes distinguent les anciens builds locaux des exécutables réellement transportés.

Le DMG hybride contient BGDD, FFmpeg/ffprobe, les polices et leurs matériaux exigés. yt-dlp et Deno sont acquis directement depuis leurs releases officielles lors de l’installation explicite, avec versions et empreintes fixées. Leur archive et leur runtime ne sont pas redistribués dans le DMG.

## Gatekeeper et systèmes restant à qualifier

Le parcours complet de la candidate finale téléchargée à distance reste non qualifié. Sur le Mac disponible, il doit couvrir, quarantaine conservée : première ouverture, autorisation humaine, auxiliaires et moteurs, téléchargement autorisé, fermeture/réouverture et désinstallation. Une exception accordée à un seul exécutable ne qualifie pas les autres. Le refus local de chargement de Python constitue un obstacle technique observé ; une signature ad hoc valide ne le résout pas. Aucun parcours manuel fiable pour ce composant n’est encore démontré.

Aucune VM locale n’est utilisée, conformément à la préférence de Henry. Les recettes distantes sont automatisées. Henry accepte leur validation native26 et ne demande plus de qualification sur un Mac physique sous26. L’interface et les autorisations Gatekeeper graphiques26 n’ont pas été observées ; cette absence reste une limite documentée, sans nouvelle demande de matériel. Les recettes locales conservent leurs HOME et profils isolés ; aucun nouveau compte macOS n’est créé, conformément à sa préférence. Le parcours exact du paquet final reste à distinguer de la variante de recette.

## Historique et périmètre

rc.1 est conservée avec son DMG, son tag, ses sources et ses preuves. Ses 350 tests, quatre transferts YouTube, annulation native, Finder et recette macOS27 ne sont pas réattribués à rc.2. Les réserves juridiques de son ancien bundle autonome restent historiques et ouvertes.

Aucun Intel, nouvel essai public X/Instagram/TikTok, écoute humaine, VoiceOver humain ou nouveau test matériel APFS/exFAT n’est revendiqué. L’installation personnelle et le Chrome personnel restent hors recette.

## État de publication

- **Préparé techniquement :** paquet construit ; installation et fonctionnement démontrés dans les périmètres ci-dessus.
- **Conforme pour distribution :** matériaux et droits de redistribution établis pour le périmètre hybride examiné.
- **Prêt à publier : non.** Parcours Gatekeeper complet du paquet final et quatre formats réseau restent à qualifier. La validation native26 virtuelle est acceptée ; aucun Mac physique26 ni nouveau compte macOS n’est exigé.
- **Public : non.** Dépôts privés ; publication conditionnée à une validation terminée et à l’accord final explicite de Henry.
