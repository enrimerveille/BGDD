# Licences et sources de BGDD 0.4.8-rc.7

27 octobre 2026 · code original gratuit et propriétaire, **Angry Thread**. Le JavaScript compilé nécessaire à l'extension est distribué ; cela n'ouvre pas les sources originales. Les restrictions BGDD excluent expressément les droits accordés par les licences tierces. [Conditions](../CONDITIONS.md).

## Matériaux fournis

| Composant | Version | Licence et matériaux |
|---|---|---|
| FFmpeg/ffprobe | 9.0.2 | GPL-2.0-or-later ; archives sources, recettes, configuration et notices |
| x264 statique | 0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee | GPL-2.0-or-later ; archive et licence intégrales |
| LAME statique | 3.100 | LGPL-2.0-or-later ; sources permettant la modification et la réédition des liens |
| Space Grotesk | 2.000 | OFL-1.1 ; fonte originale et notice |

Les sources et versions des codecs ARM n'ont pas changé. `VERSIONS-arm64.json.media` ou `VERSIONS-x86_64.json.media` de la release identifie le build effectivement utilisé ; les inventaires du payload identifient les exécutables après signature. Les premiers relevés de construction conservés dans le kit sont historiques, et ne remplacent pas ces empreintes. Les kits `BGDD-third-party-sources-arm64.zip` et `BGDD-third-party-sources-x86_64.zip` contiennent les sources tierces correspondantes, sans code propriétaire BGDD.

## Frontière des programmes et remplacement

FFmpeg/ffprobe restent des processus autonomes à interface de ligne de commande. Leur emplacement dans BGDD Engine.app ne crée ni liaison de bibliothèque avec le host ni chargement de code propriétaire dans les moteurs. L'analyse de séparation repose sur les appels et les données échangées, pas seulement sur le nombre de fichiers. [Analyse des frontières](DISTRIBUTION-BOUNDARIES.md), [critères de la FSF](https://www.gnu.org/licenses/gpl-faq.en.html#MereAggregation), [licences FFmpeg](https://www.ffmpeg.org/legal.html).

La recette indépendante `install-codecs.pl`, sous GPL-2.0-or-later, prépare une nouvelle enveloppe contenant vos codecs reconstruits. Elle renouvelle son sceau ad hoc et les empreintes locales, conserve les autres composants et sauvegarde l'application originale avec les métadonnées. Préférences, historique et médias sont conservés. Aucune clé privée ni source propriétaire n'est requise. Une nouvelle autorisation macOS peut être nécessaire ; le script ne supprime ni quarantaine ni protection. Une exécution isolée de cette recette a été acceptée par le vérificateur de production rc4. La qualification du paquet exact reste distincte.

## Moteurs obtenus directement

L'installation récupère yt-dlp **2026.08.19**, son runtime Python/EJS et Deno **2.9.7** depuis les releases officielles fixées, à la demande de l'utilisateur. Le DMG et le kit BGDD ne contiennent pas leurs binaires ou archives. Le bundle yt-dlp conserve sa licence GPL-3.0-or-later ; Deno et ses dépendances conservent leurs licences propres. Ce mode de livraison ne change aucun droit amont.

Les réserves historiques concernant une éventuelle redistribution du bundle Python/yt-dlp et la clôture des notices transitives Deno restent ouvertes pour toute future redistribution de ces binaires par Angry Thread. Elles ne sont pas présentées comme résolues par ce paquet hybride.

Les matériaux contrôlés de rc4 contiennent les mêmes 23 notices/sources autorisées et 15 fichiers du kit tiers, avec seulement la recette de remplacement et son guide adaptés. L'inventaire exact du conteneur, les droits sur ses entrées et sa qualification macOS/Chrome restent des contrôles distincts. Une signature ad hoc est un sceau technique, pas une identité Apple ni une certification juridique.
