# BGDD 0.4.8-rc.6

Angry Thread · préversion gratuite et propriétaire · Apple Silicon · macOS 27 uniquement.

L’installateur suit désormais l’apparence claire ou sombre de macOS, y compris les changements pendant son ouverture. Il reprend la palette BGDD et Space Grotesk, avec des boutons natifs, des messages longs défilants et des confirmations système conservées. Le composant installateur passe à 0.4.9.

L’extension 0.4.8, le host, le gardien et le moteur 0.3.5, le sélecteur 0.3.4, les codecs et Native Messaging 2 conservent exactement les octets de la rc.4 qualifiée. Les formats et le fonctionnement des téléchargements ne changent pas. Les corrections de copie et de lancement du moteur introduites en rc.4 sont conservées.

Le minimum technique inscrit dans le paquet est macOS 26. La compatibilité proposée pour cette préversion reste limitée à **macOS 27 sur Apple Silicon**. macOS 26 ARM n’est pas qualifié ; Intel dispose d’une candidate privée et d’une validation distincte. Les essais de compilation croisée ne constituent pas une exécution native Intel.

BGDD reste distribué sans certificat Apple Developer ID ni notarisation. L’utilisateur décide personnellement des ouvertures proposées par macOS. yt-dlp et Deno sont acquis depuis leurs releases officielles, avec versions, empreintes et inventaires fixés. Le DMG contient uniquement les codecs reconstruits et les autres composants prévus. Les garanties d’intégrité et de quarantaine sont inchangées.

Le dossier, l’identité de l’extension, les réglages et l’historique sont conservés par la mise à jour transactionnelle. Aucun daemon, serveur local, surveillance ou mise à jour silencieuse n’est ajouté. Les fichiers téléchargés restent conservés, y compris après désinstallation.

Les documents du paquet décrivent sa préparation. Les validations finales et limites sont consignées dans la release publiée et la documentation en ligne. Les assets ARM rc.4 publiés restent inchangés.

[Installation](DISTRIBUTION-INSTALL.md) · [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) · [Validation et limites](DISTRIBUTION-VALIDATION.md) · [Licences et sources](DISTRIBUTION-LICENSES.md).
