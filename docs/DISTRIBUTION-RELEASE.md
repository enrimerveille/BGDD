# BGDD 0.4.8-rc.3

Angry Thread · préversion de distribution gratuite et propriétaire. Extension **0.4.8**, host **0.3.4**, Native Messaging **2** ; aucune annonce 1.0 stable.

Les candidates rc.1 et rc.2, leurs tags et leurs preuves restent historiques. rc.2 a introduit le minimum technique macOS **26.0 arm64** et le téléchargement direct à versions fixes des moteurs officiels. rc.3 conserve cette stratégie et assemble **BGDD Engine** localement après acquisition de yt-dlp, pour regrouper son runtime ; FFmpeg, ffprobe et Deno restent séparés. L’assemblage, l’intégrité et le remplacement des codecs sont vérifiés sur26/27. Les fonctions du produit 0.4.8 sont conservées.

## Changements

- Licence originale propriétaire gratuite, avec droits tiers séparés ; proposition MIT abandonnée.
- Distribution préparée dans **BGDD-downloads**, séparément du dépôt de développement privé BGDD.
- Installateur AppKit compact, sources et progression réelle lors de la récupération officielle yt-dlp/Deno ; installation transactionnelle et protection des données.
- Bouton **Ouvrir le moteur** après installation : préparation ponctuelle des versions yt-dlp → FFmpeg → ffprobe, sans média, avec arrêt au premier échec. L’utilisateur décide lui-même des ouvertures proposées par macOS et rouvre ensuite le moteur. Le bouton est observé dans le véritable installateur SDK26 ; la qualification de cette séquence AppKit reste **UNKNOWN / non qualifiée**. Les deux recettes du harnais sont en échec, sans changement du produit ; aucun défaut moteur ou Gatekeeper n’en est déduit.
- yt-dlp/Python sont disposés dans l’app Engine à l’installation ; leurs binaires ne sont pas transportés dans le DMG BGDD. Les codecs conservent leur emplacement externe et la recette indépendante de remplacement sous GPL.
- Reconstruction réelle des composants BGDD et codecs avec target 26, inspection architectures/minimums/imports. La compilation seule n’établit pas une qualification d’OS.
- Recherche volontaire de mise à jour fondée sur HTTPS, version, taille, SHA-256 et ressources attendues, sans prétendre vérifier un Developer ID absent.
- Absence de Developer ID et de notarisation explicitement assumée ; autorisation Gatekeeper officielle par l’utilisateur lorsqu’elle est proposée. Aucune suppression de quarantaine, politique modifiée ou autorisation simulée.

Le JavaScript de l’extension reste inspectable ; le code original n’est pas publié sous une licence open source. Les codecs GPL et la fonte OFL conservent leurs droits et sources. Les matériaux tiers inchangés portent encore certains intitulés rc2 : ils décrivent leur origine historique, sans restreindre leurs droits à cette version. Les réserves du bundle autonome rc.1 restent applicables à ses propres binaires.

## Installer et entretenir

Le [guide utilisateur](DISTRIBUTION-INSTALL.md) décrit l’installation sans Terminal, le chargement Chrome manuel, la mise à jour volontaire et la désinstallation. Les téléchargements sont conservés par défaut ; l’effacement des données natives est explicite. [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) décrit le parcours officiel et ses limites.

## État de préparation

Le dépôt de distribution reste privé et la release demeure en brouillon avant l’accord final de l’éditeur. L’autorisation publique n’est pas donnée. Le run rc3 **38305324669** réussit sur26/27 : paquet exact de68 fichiers,23 matériaux juridiques, kit tiers15, remplacement GPL, maintenance, cinq recettes codec et sept contrôles Chrome par OS. L’audit externe du paquet est conforme dans ces scopes ; le statut inputs scellé reste distinct. Les **mêmes codecs SDK26** passent ensuite cinq recettes sur chaque OS sans reconstruction. L’interface canonique SDK26 est observée en lecture seule sur27, sans installation ; la préparation AppKit reste non qualifiée et Gatekeeper manuel n’est pas démontré. Aucun média réseau rc3 n’était demandé.

[Validation macOS 26 et 27](DISTRIBUTION-VALIDATION.md) distingue ces preuves et leurs limites. Les faits rc2 et ceux du prototype privé SDK27 gardent leur portée historique, sans transfert à rc3. [Conformité](DISTRIBUTION-LICENSES.md) décrit le verdict exact et les droits tiers. Un futur rafraîchissement de documentation exige de nouvelles empreintes de conteneur et le contrôle de l’identité de l’app ; le verdict ne couvre pas une variante non vérifiée.

## Plateformes et limites

Qualité maximale, MP4 H.264/AAC sans réencodage vidéo, WAV/MP3 choisis, carrousels et images ZIP gardent leur comportement 0.4.8. Les adaptateurs ne garantissent pas l’accès à toutes les publications. YouTube public autorisé, fixtures des autres parcours, nouvelles recettes réseau, APFS/exFAT, écoute humaine et VoiceOver gardent des catégories de preuve distinctes. Intel n’est pas pris en charge.
