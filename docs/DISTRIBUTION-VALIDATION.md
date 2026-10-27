# Validation des variantes BGDD

## Intel 0.4.8-rc.5 — publication du 27 octobre 2026

Préversion Intel x86_64 pour macOS 26. Le test physique du 22 octobre a été réalisé sur Mac Pro Intel 2019 sous **macOS 26.5.2**. Installation graphique, autorisation Gatekeeper humaine, moteur et ses quatre outils, adaptation clair/sombre en direct, quatre téléchargements réseau autorisés (qualité maximale, MP4, WAV, MP3), annulation, mise à jour de la même candidate et désinstallation : **PASS**. Tous les exécutables disposent de x86_64 ; yt-dlp téléchargé lors de l’installation est universel.

Les essais réseau utilisent le host installé, piloté avec les trames Native Messaging depuis un outil de recette. **Chrome → Native Messaging → téléchargement sur Intel : NON TESTÉ.** Cette limite a été explicitement acceptée pour la publication. Une assertion indépendante du solveur EJS et une couverture exhaustive des erreurs longues/focus n’ont pas été réalisées sur le Mac physique. Aucun échec réseau n’a été remplacé par un résultat simulé.

Médias Coffee Run (Blender Studio, CC BY), sans cookies ni compte : maximum MKV AV1/Opus 2048×858 ; MP4 H.264/AAC 1920×804 ; WAV PCM 24 bits ; MP3 320 kb/s. Le moteur a vérifié les sorties puis effectué une publication atomique exclusive. Les fichiers de recette et l’installation ont été retirés après les essais.

DMG exact, sans reconstruction : `00528e5825058ebb53d4bfc166c0188ea084e842b8baa7bebbd64a22c70584c0`. Les documents et métadonnées embarqués conservent leur état historique de préparation privée ; la décision de publication ci-dessus les complète. [Release Intel](https://github.com/enrimerveille/BGDD-downloads/releases/tag/v0.4.8-rc.5).

## Apple Silicon 0.4.8-rc.6 — résultats conservés

**Apple Silicon, macOS 27 uniquement.** La version locale réellement utilisée est macOS 27.0.1. macOS 26 ARM n’est pas qualifié ; aucune simulation ni compilation ne tient lieu de preuve d’exécution de cette version du système.

DMG final : `ad3a04c39568c37a2e11a86a6fc4da6b5b39a367b99aa648d04e69c817a46e61` (34 946 837 octets). Kit tiers inchangé : `11d4bac4db87a45df947a5da11e945c5b1fe1e115408b5c9788ef55eb8a541bb`.

## Vérifications propres à cette livraison

L’installateur 0.4.9 suit l’apparence système AppKit. Clair, sombre et changement d’apparence dans la même fenêtre de production ont été observés. La vérification des composants a réussi et la confirmation native de désinstallation a été ouverte puis annulée. Les deux captures publiées proviennent de cette vraie fenêtre. Tous les fichiers de cette app sont identiques à ceux du conteneur final, dont seule la documentation extérieure avait ensuite été actualisée.

Les essais isolés du même code d’interface couvrent aussi chargement, erreur longue, défilement, focus clavier et confirmation native pendant un changement d’apparence. Ce sont des scénarios visuels de test, distincts de l’installation de production. Aucun flash blanc n’a été observé ; aucune mesure vidéo image par image ni session VoiceOver humaine n’est revendiquée.

Le paquet final passe les contrôles d’inventaire, empreintes, architecture, signatures techniques et sources tierces. La recette isolée du cœur de production utilise son payload exact pour installation, mise à jour, remplacement des codecs, retrait et réinstallation, en vérifiant la conservation des données. Les contrôles ciblés de maintenance, versions et confiance passent (87 assertions/scénarios). Les garanties Gatekeeper et de quarantaine ne changent pas.

**Conteneur final :** le DMG final a été téléchargé avec sa quarantaine normale par Safari, puis ouvert après la décision humaine macOS. La fenêtre de production et sa vérification des composants ont réussi. Les 68 fichiers de l’app en cours d’exécution correspondent exactement à la candidate contrôlée. Aucune quarantaine n’a été supprimée ni aucune protection macOS modifiée.

La mise à jour graphique de production depuis la rc.4 a ensuite réussi. Les 195 fichiers installés, 22 liens et le sceau strict du moteur ont été vérifiés. La vraie fenêtre du moteur confirme la réussite de yt-dlp, Deno, FFmpeg et ffprobe. Réglages natifs et fichiers téléchargés sont inchangés. La carte Chrome existante a été actualisée avec la même identité et le même dossier. Le diagnostic Native Messaging affiche le composant prêt ; le processus du host est lancé par Chrome depuis le dossier canonique, puis le gardien et le sélecteur natif ont été observés. Le panneau de dossier a été annulé sans changement. Les réglages et l’historique Chrome ont été comparés intégralement avant/après et sont identiques. Les preuves média rc.4 des exécutables inchangés restent distinguées ci-dessous.

## Résultats réutilisés des composants inchangés

Les octets de l’extension, du moteur, du host, du gardien, du sélecteur et des codecs sont ceux de la rc.4 qualifiée. Les essais réels des quatre formats ci-dessous sont conservés comme preuves historiques de ces composants ; ils n’ont pas été répétés pour la modification de l’apparence.

## Intel, preuve séparée et candidate privée

La candidate Intel a passé les contrôles statiques, puis une exécution native sur **macOS 26.6.1 x86_64, processeur Intel**, dans un runner public standard gratuit. Inventaire du DMG exact, signatures, versions des codecs et recette isolée du cœur de production ont réussi. Le transport privé temporaire a été supprimé ; aucun code propriétaire source, paquet Intel ou donnée personnelle n’a été publié.

Restent à qualifier sur Intel : véritable interface graphique et décisions Gatekeeper, moteur installé et Native Messaging avec Chrome, puis parcours média complet de la candidate. La compilation croisée ARM et Rosetta ne remplacent pas ces preuves. Intel demeure privé et non qualifié pour distribution.

---

# Preuves historiques de BGDD 0.4.8-rc.4

**Cette préversion ARM prend en charge macOS 27 uniquement ; parcours de production validé sur macOS 27.0.1.** macOS 26 reste non qualifié. Le minimum technique 26 inscrit dans le paquet ne constitue pas une prise en charge de macOS 26. Intel n’est pas qualifié par ces résultats.

DMG exact : `e964a235b19866ada1e0ff5d13b5816680516547561fee2931f7db8ee9bc3c56` (35 359 408 octets).

## Parcours réellement exécuté sur macOS 27

Le DMG a été téléchargé dans un navigateur avec sa quarantaine normale, puis ouvert graphiquement. L’utilisateur a autorisé **BGDD Installer.app**, puis **BGDD Engine.app**, depuis **Confidentialité et sécurité → Ouvrir quand même** et la confirmation finale. Installation de production, 195 fichiers installés et signature technique stricte du moteur vérifiés. Les quatre outils ont réussi dans l’interface du moteur ; host, gardien et sélecteur ont ensuite fonctionné depuis Chrome isolé.

L’extension exacte a communiqué avec le host livré. Le vrai bouton **Télécharger** sur la publication publique Coffee Run de Blender Studio (CC BY 4.0) a produit :

| Format | Fichier observé |
|---|---|
| Qualité maximale | MKV, AV1 2048×858 et Opus |
| MP4 compatible | H.264 1920×804 et AAC |
| WAV | PCM 24 bits, 44,1 kHz |
| MP3 | MP3, 44,1 kHz |

Durées proches de 184,7 secondes, pistes contrôlées par FFprobe, fichier montré dans Finder. VLC a affiché le MKV en lecture. Le FFmpeg livré a décodé vidéo et audio du MP4. Le décodage vidéo AV1 par ce FFmpeg a échoué sur ce Mac ; il n’inclut pas de décodeur logiciel AV1 et l’accélération disponible ne convenait pas. La lecture du format maximal dépend donc du lecteur et des codecs de la machine ; choisir MP4 compatible si nécessaire. Aucune écoute humaine n’est revendiquée.

Deno et les bibliothèques EJS exactes installées ont exécuté quatre défis synthétiques. Cela démontre une exécution réelle EJS ; aucun défi EJS n’a été observé pendant le téléchargement YouTube. Annulation depuis le bouton, puis arrêt du seul navigateur de test pendant une autre tâche : descendants arrêtés en environ 1,2 seconde, sans temporaire restant.

## Maintenance et protections

La recette isolée du Core de production a vérifié installation, remplacement des codecs, mise à jour, désinstallation et réinstallation, conservation des médias et des préférences, puis effacement explicite des préférences. Son pilote réservé aux tests reste distinct du parcours graphique de production. Les tests ciblés couvrent le transfert exclusif, les empreintes, la quarantaine, les erreurs du gardien et sa supervision. Les données de l’installation personnelle ont été restaurées et comparées à leur état initial ; le Chrome personnel n’a pas servi aux tests.

## Limites

Les contrôles du code rc.4 sur macOS 26 n’ont pas démarré : deux demandes de runner ARM ont échoué faute de capacité hébergée. Les anciennes preuves natives des codecs inchangés ne qualifient pas les nouvelles parties de rc.4.

Le profil Chrome neuf ne rend pas vierge l’historique Gatekeeper du Mac. La signature ad hoc ne constitue pas une identité Apple ; BGDD n’est pas notarisé. Les autorisations de sécurité restent humaines. Les documents inclus dans le DMG sont le relevé de préparation antérieur à cette recette ; cette page et les notes de la release indiquent les résultats obtenus ensuite, sans modifier les octets du paquet testé.

X, Instagram et TikTok gardent leurs propres restrictions d’accès ; cette recette réseau porte sur YouTube. Aucun accès universel, privé ou contournement d’authentification n’est promis. Intel macOS 26 nécessite ses propres preuves natives et son parcours d’ouverture.
