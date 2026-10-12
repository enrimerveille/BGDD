# BGDD 0.4.8-rc.2

Angry Thread · préversion de distribution gratuite et propriétaire. Extension **0.4.8**, host **0.3.4**, Native Messaging **2** ; aucune annonce 1.0 stable.

La candidate rc.1, son tag et ses preuves sont conservés. rc.2 adapte la distribution à un minimum technique macOS **26.0 arm64**, conserve les fonctions du produit et introduit un bootstrap à versions fixes pour les moteurs directement fournis par leurs auteurs.

## Changements

- Licence originale propriétaire gratuite, avec droits tiers séparés ; proposition MIT abandonnée.
- Distribution préparée dans **BGDD-downloads**, séparément du dépôt de développement privé BGDD.
- Installateur AppKit compact, sources et progression réelle lors de la récupération officielle yt-dlp/Deno ; installation transactionnelle et protection des données.
- Reconstruction réelle des composants BGDD et codecs avec target 26, inspection architectures/minimums/imports. La compilation seule n’établit pas une qualification d’OS.
- Recherche volontaire de mise à jour fondée sur HTTPS, version, taille, SHA-256 et ressources attendues, sans prétendre vérifier un Developer ID absent.
- Absence de Developer ID et de notarisation explicitement assumée ; autorisation Gatekeeper officielle par l’utilisateur lorsqu’elle est proposée. Aucune suppression de quarantaine, politique modifiée ou autorisation simulée.

Le JavaScript de l’extension reste inspectable ; le code original n’est pas publié sous une licence open source. Les codecs GPL et la fonte OFL conservent leurs droits et sources. Les réserves du bundle autonome rc.1 restent applicables à ses propres binaires.

## Installer et entretenir

Le [guide utilisateur](DISTRIBUTION-INSTALL.md) décrit l’installation sans Terminal, le chargement Chrome manuel, la mise à jour volontaire et la désinstallation. Les téléchargements sont conservés par défaut ; l’effacement des données natives est explicite. [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) décrit le parcours officiel et ses limites.

## État de préparation

Le dépôt de distribution reste privé et la release doit rester en brouillon avant l’accord final de Henry. L’autorisation publique n’est pas donnée. [Validation macOS 26 et 27](DISTRIBUTION-VALIDATION.md) distingue compilation, fixtures, VM réelles, Chrome et intervention Gatekeeper manuelle. [Conformité](DISTRIBUTION-LICENSES.md) indique le périmètre des droits établi pour les octets effectivement contrôlés.

## Plateformes et limites

Qualité maximale, MP4 H.264/AAC sans réencodage vidéo, WAV/MP3 choisis, carrousels et images ZIP gardent leur comportement 0.4.8. Les adaptateurs ne garantissent pas l’accès à toutes les publications. YouTube public autorisé, fixtures des autres parcours, nouvelles recettes réseau, APFS/exFAT, écoute humaine et VoiceOver gardent des catégories de preuve distinctes. Intel n’est pas pris en charge.
