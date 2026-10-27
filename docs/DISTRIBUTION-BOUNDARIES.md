# BGDD et ses composants tiers

BGDD est gratuit et propriétaire pour son code original. Les composants tiers conservent leurs licences, leurs sources correspondantes et les droits qu’elles accordent. Les [conditions BGDD](../CONDITIONS.md) ne limitent pas ces droits.

## Ce que contient la distribution

Le DMG fournit BGDD, les codecs FFmpeg/ffprobe avec x264 et LAME, et la police Space Grotesk. Les sources exactes des codecs, leurs licences et les scripts de construction et de remplacement sont disponibles dans les kits tiers de la [release](https://github.com/enrimerveille/BGDD/releases/tag/v0.4.8-rc.9).

yt-dlp, son runtime Python/EJS et Deno sont téléchargés directement depuis leurs releases officielles pendant l’installation. Leurs binaires et archives ne sont pas hébergés dans le DMG BGDD. Ce mode de fourniture ne modifie pas leurs licences.

## Programmes indépendants

L’extension communique avec le composant macOS par Native Messaging. Le composant macOS lance yt-dlp, Deno, FFmpeg et ffprobe comme programmes distincts, au moyen de leurs interfaces de commande. Les échanges portent sur des commandes, des métadonnées et des fichiers média ; aucune bibliothèque média n’est liée au code original BGDD.

Les outils sont regroupés dans **BGDD Engine.app**. Ce regroupement ne modifie pas leurs licences. x264 et LAME sont liés statiquement aux codecs FFmpeg/ffprobe et restent couverts par les licences indiquées dans les [notices](DISTRIBUTION-LICENSES.md).

## Reconstruire et remplacer les codecs

Les [instructions et scripts publics](../sources/README.md) permettent de reconstruire les codecs et de les remplacer dans une copie locale, y compris avec des versions modifiées de LAME ou de x264. Aucune clé privée ni source propriétaire BGDD n’est requise. Une nouvelle autorisation macOS peut être nécessaire.

Les droits d’étude, de modification, de réédition des liens, de débogage et de redistribution accordés par les licences tierces restent applicables. Les contrôles d’intégrité de la distribution officielle ne retirent pas ces droits.

[Licences et sources](DISTRIBUTION-LICENSES.md) · [Inventaire des composants](DISTRIBUTION-DEPENDENCIES.md)
