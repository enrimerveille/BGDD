# Distribution 0.4.8-rc.2 Validation

La candidate gratuite propriétaire cible **macOS 26 et 27 arm64**. Le minimum technique 26.0 est inspecté ; il ne constitue pas une preuve de fonctionnement sur macOS 26. Le dépôt de développement et la vitrine restent privés. La conformité de redistribution de l’architecture hybride est établie pour les matériaux contrôlés ; la publication publique n’est pas autorisée.

## Preuves actuelles séparées

| Périmètre | Résultat observé | Limite |
|---|---|---|
| Build natif et codecs | Installateur, host, gardien, sélecteur, FFmpeg et ffprobe réellement compilés target26 ; architectures, minimums, SDK et imports inspectés | Build local SDK27 ; exécution sous OS26 à mesurer en VM |
| Installateur et updater | 86 validations maintenance/versions/origines/transactions réussies, dont refus legacy avant mutation | Fixtures et HOME marqués, pas autorisation Gatekeeper humaine |
| Bootstrap | 36 contrôles de configuration, pins, archives ZIP, chemins et quarantaine réussis | Inspection de vraies archives officielles et entrées malveillantes ; aucun transfert réussi déduit de ces tests |
| Vitrine | Audit local des fichiers suivis et de tout l’historique du dépôt indépendant, tests secrets/source privée/archives altérées | Aucun scanner externe ni publication publique |
| Paquet hybride local | 58 fichiers payload, 66 fichiers application, six Mach-O, aucun runtime upstream exclu | Installation réseau encore à qualifier |
| Sources et licences | 23 matériaux juridiques et kit de 15 fichiers tiers contrôlés ; compilation réellement exécutée | Autorisation de redistribution ne prouve ni compatibilité OS ni ouverture Gatekeeper |
| Acquisition officielle locale | Une tentative yt-dlp a reçu HTTP504, zéro octet ; échec signalé | Indisponibilité réseau mesurée, aucune version ou empreinte remplacée |
| VM authentiques 26/27 | Matrice GitHub Actions préparée | Résultats rc2 pas encore acquis à ce stade |
| Gatekeeper manuel | Procédure officielle documentée, quarantaines préservées | Aucune autorisation utilisateur simulée ni parcours complet déclaré |

## Recettes attendues

La matrice demande installation déplacée, vrais moteurs, Chrome vierge, quatre formats Coffee Run public sous CC BY4.0, historique, destination, Finder, annulation, mise à jour avec conservation et désinstallation. Les transferts réseau doivent tous finir en done pour qualifier leurs quatre formats ; un état unavailable/auth/interrupted ne constitue pas un succès. Les pages synthétiques servent à la metadata/capture, tandis que le host reçoit le média réel directement de YouTube, sans cookie ou compte personnel.

Le choix NSOpenPanel et l’autorisation Gatekeeper graphique demandent des interactions séparées de la recette headless. Une VM locale GUI26 est préparée techniquement, avec image Apple officielle identifiée ; son stockage et sa qualification restent à établir.

## Historique conservé

rc.1 a été conservée avec son DMG, tag, sources et preuves. Ses 350 tests historiques, Chrome156.0.8078.4, quatre transferts YouTube, annulation native et Finder, ainsi que la VM macOS27.0.1, ne sont pas réattribués à rc.2. Les réserves juridiques de son bundle autonome demeurent ouvertes.

## Limites

Aucun Intel, nouvelle recette réseau X/Instagram/TikTok, écoute humaine, VoiceOver humain ou nouveau test matériel APFS/exFAT n’est revendiqué. Aucune installation personnelle n’est modifiée. Les preuves de recette sont locales ou dans la CI privée, sans logs ni historique personnel dans la vitrine.
