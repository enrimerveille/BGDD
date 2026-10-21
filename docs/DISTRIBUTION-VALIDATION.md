# Validation de BGDD 0.4.8-rc.4

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
