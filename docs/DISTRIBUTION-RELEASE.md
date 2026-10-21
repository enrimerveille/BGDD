# BGDD 0.4.8-rc.4

Angry Thread · préversion gratuite et propriétaire · extension **0.4.8** · host, gardien et moteur **0.3.5** · sélecteur **0.3.4** · Native Messaging **2**.

**Préversion ARM pour macOS 27 uniquement.** [Télécharger](https://github.com/enrimerveille/BGDD-downloads/releases/download/v0.4.8-rc.4/BGDD-macOS-arm64.dmg). macOS 26 reste non qualifié pour le code modifié.

Cette candidate corrige le transfert du moteur et son lancement. Les fichiers du runtime sont déplacés exclusivement sur le même volume APFS, avec contrôles séparés des octets, de l'identité du fichier et de la quarantaine. Le gardien, le host, Deno et les codecs rejoignent l'application moteur ; le sélecteur est un auxiliaire imbriqué. L'état utilisateur reste extérieur à l'application signée. Le diagnostic identifie le gardien séparément de l'outil demandé et refuse toute réussite fondée sur une sortie 0 accompagnée d'un signal.

Les versions de yt-dlp/Python/EJS, Deno, FFmpeg, x264 et LAME restent inchangées. yt-dlp et Deno sont téléchargés directement depuis leurs releases officielles, avec URL, versions, archives et inventaires fixés. Le DMG ne contient pas ces moteurs amont. Les codecs ARM existants sont réutilisés. Le kit tiers adapte le remplacement volontaire de FFmpeg/ffprobe à la nouvelle enveloppe ; il conserve les sources et la recette de construction.

Les formats, la qualité, l'identité Chrome, l'extension et le fonctionnement local restent conservés. L'exigence APFS concerne le staging d'installation ; elle n'interdit pas les dossiers de téléchargement sur exFAT. Aucun daemon, serveur local ou recherche périodique n'est ajouté.

BGDD n'a ni certificat Developer ID ni notarisation. L'utilisateur décide personnellement des ouvertures que macOS propose. [Installation](DISTRIBUTION-INSTALL.md) · [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) · [Validation et limites](DISTRIBUTION-VALIDATION.md) · [Licences et sources](DISTRIBUTION-LICENSES.md).

rc.3 reste historique et non recommandée : son installateur a échoué lors de la copie du moteur. Ses assets ne sont pas remplacés. Le parcours du DMG exact a réussi sur macOS 27.0.1, avec autorisations humaines de l’installateur et du moteur, puis téléchargement depuis le vrai bouton Chrome dans les quatre formats. Intel macOS 26 fait l'objet d'une qualification distincte.

Les documents et métadonnées contenus dans les assets immuables sont le relevé de préparation ; la présente release et la page Validation consignent la qualification obtenue ensuite. Le libellé initial du composant peut encore afficher 0.3.4 ; après installation, le récapitulatif affiche correctement 0.3.5.
