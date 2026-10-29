<p align="center"><picture><source media="(prefers-color-scheme: dark)" srcset="https://github.com/enrimerveille/BGDD/raw/main/assets/wordmark-dark.svg"><img src="https://github.com/enrimerveille/BGDD/raw/main/assets/wordmark-light.svg" width="220" alt="BGDD"></picture></p>
<p align="center"><strong>KEEP THE BYTES.</strong><br>Téléchargez vidéos et audio dans la meilleure qualité disponible, directement sur votre Mac.<br>Optimisé pour YouTube, Instagram, TikTok, X et Vimeo. Détection à la demande de lecteurs reconnus et de vidéos HTML5 directes sur d’autres sites.<br>by Angry Thread</p>
<p align="center">Français · <a href="README.en.md">English</a></p>

BGDD est un logiciel **gratuit et propriétaire** qui associe une extension Chrome à un moteur local macOS. Choisissez une publication, un format et un dossier : le téléchargement et le traitement se font sur votre Mac. Aucun compte BGDD, abonnement, serveur de téléchargement ou télémétrie.

<!-- bgdd:release:start -->
**Version 0.6.7 — Apple Silicon et Intel.** [Notes de version](https://github.com/enrimerveille/BGDD/releases/tag/v0.6.7).

| Votre Mac | Télécharger |
|---|---|
| Apple Silicon (ARM64), macOS 27 | [DMG Apple Silicon](https://github.com/enrimerveille/BGDD/releases/download/v0.6.7/BGDD-macOS-arm64.dmg) |
| Intel (x86_64), macOS 26 | [DMG Intel](https://github.com/enrimerveille/BGDD/releases/download/v0.6.7/BGDD-macOS-x86_64.dmg) |
<!-- bgdd:release:end -->

<p align="center"><img src="https://github.com/enrimerveille/BGDD/raw/main/assets/popup-light.png" width="320" alt="BGDD clair">&emsp;<img src="https://github.com/enrimerveille/BGDD/raw/main/assets/popup-dark.png" width="320" alt="BGDD sombre"></p>

Si la recherche de mises à jour d’une ancienne version ne fonctionne plus, [téléchargez la dernière version](https://github.com/enrimerveille/BGDD/releases), puis mettez à jour BGDD sans supprimer l’extension Chrome.

## Choisir son format

| Format | Résultat |
|---|---|
| Qualité maximale | Meilleurs flux accessibles, sans réencodage vidéo ; MKV si nécessaire |
| H.265 | MP4 HEVC depuis la meilleure source accessible ; conversion matérielle si nécessaire. Affiché seulement sur les Mac compatibles |
| H.264 compatible | Flux H.264/AAC disponibles, sans transcodage ; résolution parfois inférieure |
| WAV | Export PCM 24 bits, fréquence et canaux de la source |
| MP3 | Débit natif lorsqu’un MP3 exploitable existe ; sinon conversion choisie, jusqu’à 320 kb/s |

H.265 recherche un compromis entre qualité visuelle, taille et temps de traitement. Il peut nécessiter une conversion avec perte et ne garantit pas un fichier plus petit qu’une source AV1 ou VP9. Si le résultat est nettement plus volumineux, vous pouvez conserver la source en Qualité maximale ou garder le H.265 vérifié. Les sources SDR 10 bits, HDR10 (PQ) et HLG en 4:2:0 peuvent être converties sur un Mac Apple Silicon compatible, sans passage en 8 bits ni conversion HDR vers SDR. Les sources déjà H.265 Main/Main 10 compatibles sont conservées sans réencodage vidéo, sur ARM comme sur Intel. Sur Intel, la conversion reste limitée au SDR 8 bits. Pour Dolby Vision, HDR10+, les formats 12 bits, 4:2:2/4:4:4 ou une colorimétrie ambiguë, choisissez Qualité maximale.

Les vidéos MKV peuvent nécessiter un lecteur compatible, comme VLC. Choisissez **H.264 compatible** pour faciliter la lecture.

YouTube, X, Instagram, TikTok et Vimeo ont des intégrations dédiées. Sur une autre page, ouvrez BGDD pour détecter les lecteurs reconnus et les fichiers vidéo HTTPS directs ; choisissez explicitement si plusieurs vidéos sont présentes. TikTok propose aussi des carrousels MP4, images ZIP et exports audio. Le bouton **B** sur X lance la qualité maximale. L’accès dépend de la publication, de la région et des changements des plateformes ; aucun accès universel ou privé n’est promis.

## Installer

1. Ouvrir le DMG adapté à votre Mac, puis **Installer BGDD.app**.
2. Consulter le guide pour les autorisations de sécurité macOS avant l’installation. [Guide Gatekeeper](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-GATEKEEPER.md).
3. Suivre les quatre étapes : **Installer BGDD / Mettre à jour BGDD**, **Préparer le moteur**, **Ajouter à Chrome**, puis **BGDD est prêt**. Dans le moteur, **Continuer** ramène à l’assistant après les quatre contrôles. L’aide et les licences sont intégrées.
4. Pour une première installation Chrome, activer **Mode développeur** et **Charger l’extension non empaquetée** depuis le dossier montré. Pour une mise à jour, cliquer **Actualiser** sur la carte BGDD existante, sans la supprimer.
5. Dans BGDD, ouvrir **Réglages → Vérifier l’installation**, fermer le popup, revenir à l’assistant et choisir **Vérifier la connexion**, puis **Terminer**.

Une connexion Internet est nécessaire à l’installation. Aucun Terminal, Homebrew, Python ou Node.js à installer. L’extension se charge manuellement ; elle ne se met pas à jour via le Chrome Web Store. [Guide détaillé](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-INSTALL.md).

## Mettre à jour ou retirer BGDD

Depuis **0.4.8-rc.10 ou avant**, téléchargez le DMG manuellement : l’ancien assistant ne peut pas ouvrir ce nouveau paquet. Pour les versions suivantes, recherchez les mises à jour depuis l’installateur. Ouvrez le nouveau paquet, puis choisissez **Mettre à jour BGDD** et **Préparer le moteur**. Dans Chrome, cliquez **Actualiser** sur BGDD et rechargez les publications déjà ouvertes. Le dossier, l’identité, les préférences et l’historique sont conservés.

Ouvrez **Désinstaller BGDD.app** dans le DMG, ou choisissez **Maintenance… → Désinstaller** dans l’installateur. L’effacement des réglages et de l’historique natifs est facultatif et décoché par défaut. **Les fichiers téléchargés sont conservés.** Retirez ensuite la carte BGDD dans Chrome.

## Limites et droits

Un téléchargement actif, une file de cinq tâches et 60 résultats d’historique. Fermer le popup laisse le transfert continuer ; fermer Chrome l’arrête sans reprise automatique. Aucun processus résident ni recherche périodique de mise à jour. Les fichiers existants ne sont jamais écrasés. Sur un disque exFAT, attendez la confirmation de réussite avant d’ouvrir le fichier, qui peut apparaître pendant sa copie finale.

BGDD est gratuit et propriétaire. Les [conditions BGDD](https://github.com/enrimerveille/BGDD/blob/main/CONDITIONS.md) ne limitent pas les droits accordés sur les composants tiers. [Licences et sources](https://github.com/enrimerveille/BGDD/blob/main/docs/DISTRIBUTION-LICENSES.md). Téléchargez uniquement les contenus que vous êtes autorisé à conserver.
