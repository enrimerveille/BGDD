# Installer et utiliser BGDD

BGDD est disponible pour **Apple Silicon (ARM64) sous macOS 27** et **Intel (x86_64) sous macOS 26**. [Choisir votre DMG](https://github.com/enrimerveille/BGDD/releases/latest).

Une connexion Internet et Google Chrome sont nécessaires. Aucun Terminal, Homebrew, Python ou Node.js à installer. BGDD est distribué **sans certificat Developer ID ni notarisation Apple** : consultez le [guide Gatekeeper](DISTRIBUTION-GATEKEEPER.md) si macOS bloque l’ouverture.

## Installer en quatre étapes

Ouvrez le DMG, puis **Installer BGDD.app**.

1. **Installer BGDD** ou **Mettre à jour BGDD** : l’assistant installe les composants nécessaires et conserve vos réglages, votre historique et le dossier de l’extension. Les moteurs supplémentaires sont téléchargés depuis leurs éditeurs, avec vérification d’intégrité.
2. **Préparer le moteur** : choisissez **Préparer le moteur**. BGDD Engine affiche les quatre contrôles. Lorsque **Moteur prêt** apparaît, choisissez **Continuer** : l’assistant confirme automatiquement le résultat et passe à Chrome. Si macOS bloque un composant, suivez le guide Gatekeeper, puis recommencez cette étape.
3. **Ajouter à Chrome** : choisissez **Ouvrir les extensions Chrome**. Lors de la première installation, activez **Mode développeur**, cliquez **Charger l’extension non empaquetée** et sélectionnez le dossier indiqué. Pour une mise à jour, choisissez **BGDD est déjà dans Chrome** si nécessaire, puis **Actualiser** sur la carte BGDD existante, sans la supprimer. Dans BGDD → Réglages, choisissez **Vérifier l’installation**, fermez le popup, puis revenez à l’assistant et cliquez **Vérifier la connexion**.
4. **BGDD est prêt** : lorsque les étapes affichent **Terminé**, cliquez **Terminer**.

Le dossier de l’extension est `~/Library/Application Support/BGDD/extension`. L’extension se charge manuellement et ne reçoit pas les mises à jour du Chrome Web Store.

## Télécharger

Ouvrez une publication YouTube, X, Instagram, TikTok ou Vimeo, puis BGDD. Choisissez le format et le dossier de destination, puis **Télécharger**. Sur les autres pages, ouvrez BGDD pour rechercher les lecteurs reconnus et vidéos HTTPS directes ; choisissez explicitement si plusieurs vidéos sont proposées. Sur X, le bouton **B** lance directement la qualité maximale.

Un téléchargement est actif à la fois. **Annuler** arrête le transfert et son traitement. Fermer le popup laisse le téléchargement continuer ; quitter Chrome l’interrompt sans reprise automatique. Les fichiers existants ne sont jamais écrasés. Sur exFAT, attendez la confirmation de réussite avant d’ouvrir le fichier.

L’accès à une session de plateforme est facultatif : il se donne et se retire dans les réglages BGDD pour le site concerné. La disponibilité dépend de la publication et des restrictions de la plateforme. Téléchargez uniquement les contenus que vous êtes autorisé à conserver.

## Choisir son format

| Format | Résultat |
|---|---|
| Qualité maximale | Meilleurs flux accessibles, sans réencodage vidéo ; MKV si nécessaire |
| H.265 | MP4 HEVC depuis la meilleure source accessible ; conversion matérielle si nécessaire. Affiché seulement sur les Mac compatibles |
| H.264 compatible | Flux H.264/AAC disponibles, sans transcodage ; résolution parfois inférieure |
| Audio original | Piste AAC/M4A privilégiée, sans réencodage ; autre piste source si nécessaire |
| WAV | Export PCM 24 bits, fréquence et canaux de la source |
| MP3 | Débit natif lorsqu’un MP3 exploitable existe ; sinon conversion choisie, jusqu’à 320 kb/s |

H.265 recherche un compromis entre qualité visuelle, taille et temps de traitement. Il peut nécessiter une conversion avec perte et ne garantit pas un fichier plus petit qu’une source AV1 ou VP9. Si le résultat est au moins 70 % plus volumineux avec au moins 20 Mo supplémentaires, hors différence principalement due à l’audio, BGDD affiche les tailles des deux fichiers : choisissez **Conserver la source** ou **Conserver le H.265**. Les sources SDR 10 bits, HDR10 (PQ) et HLG en 4:2:0 peuvent être converties sur un Mac Apple Silicon compatible, sans passage en 8 bits ni conversion HDR vers SDR. Les sources déjà H.265 Main/Main 10 compatibles sont conservées sans réencodage vidéo, sur ARM comme sur Intel. Sur Intel, la conversion reste limitée au SDR 8 bits. Pour Dolby Vision, HDR10+, les formats 12 bits, 4:2:2/4:4:4 ou une colorimétrie ambiguë, choisissez Qualité maximale.

Les vidéos MKV peuvent nécessiter un lecteur compatible, comme VLC. Choisissez **H.264 compatible** pour faciliter la lecture.

YouTube, X, Instagram, TikTok et Vimeo ont des intégrations dédiées. Sur une autre page, ouvrez BGDD pour détecter les lecteurs reconnus et les fichiers vidéo HTTPS directs ; choisissez explicitement si plusieurs vidéos sont présentes. TikTok propose aussi des carrousels MP4, images ZIP et exports audio. Le bouton **B** sur X lance la qualité maximale. L’accès dépend de la publication, de la région et des changements des plateformes ; aucun accès universel ou privé n’est promis.


Pendant une opération, la source et le résultat attendu sont résumés une seule fois. Après enregistrement, les caractéristiques affichées sont celles du fichier vérifié ; **Détails** conserve les informations complémentaires.

## Mettre à jour, réparer ou désinstaller

**Maintenance…** permet de rechercher volontairement une mise à jour, de vérifier les composants, de réparer l’installation ou de la désinstaller. Les mises à jour ne s’installent pas automatiquement.

Après une mise à jour, actualisez la carte BGDD dans Chrome et rechargez les publications déjà ouvertes. Gardez la carte existante pour conserver ses réglages, autorisations et historique.

Pour désinstaller, ouvrez **Désinstaller BGDD.app** dans le DMG ou choisissez **Maintenance… → Désinstaller**, puis retirez la carte BGDD dans Chrome. L’effacement des préférences natives est facultatif ; Chrome supprime ses propres données lorsque l’extension est retirée. **Vos fichiers téléchargés sont conservés.**

Si la recherche de mises à jour d’une ancienne version ne fonctionne plus, [téléchargez la dernière version manuellement](https://github.com/enrimerveille/BGDD/releases), puis suivez les étapes ci-dessus sans supprimer l’extension.

[English installation instructions](../README.en.md#install) · [Licences et sources tierces](DISTRIBUTION-LICENSES.md)

## Anciennes versions

Depuis **0.4.8-rc.10 ou avant**, téléchargez manuellement le dernier DMG : l’ancien assistant refuse les paquets avec deux applications. Installez la mise à jour, puis actualisez la carte Chrome existante sans la supprimer.

## Audio, file et notifications

**Audio original** privilégie une piste M4A lorsqu’elle est disponible, sans réencodage. BGDD choisit la meilleure piste AAC adaptée, sans sacrifier les canaux connus pour obtenir du M4A. À défaut, une autre piste source est copiée : Opus reste dans un conteneur Opus/Ogg adapté. Un codec sans conteneur pris en charge est refusé sans conversion cachée. Ce mode favorise la compatibilité ; il ne garantit ni le meilleur codec perceptuel ni le master de l’auteur. WAV et MP3 conservent leur fonctionnement propre.

L’avertissement de doublon compare publication, élément et format ; **Afficher dans le Finder**, **Télécharger à nouveau** et **Fermer** restent proposés. Un ancien résultat Audio original en Opus n’est pas considéré comme équivalent à une nouvelle piste AAC/M4A. Les anciens exports locaux restent dans l’historique et accessibles dans le Finder ; leur création n’est plus proposée. Effacer l’historique conserve les fichiers.

Dans **En attente**, **Mettre en pause** laisse finir l’opération en cours et bloque seulement les suivantes. **Reprendre** autorise leur démarrage. Les commandes disparaissent lorsqu’aucune tâche n’attend ; une file entièrement vide ne conserve pas une pause invisible. Une limitation HTTP 429 suspend seulement les prochains téléchargements du site concerné ; la reprise reste manuelle et respecte un éventuel délai serveur. Fermer Chrome interrompt les opérations sans reprise automatique.

Les réglages donnent accès à `chrome://extensions/shortcuts`. **Ouvrir BGDD** affiche le popup. **Télécharger avec BGDD** ajoute directement la vidéo unique de l’onglet actif avec le dernier format choisi. En cas de plusieurs vidéos, choix requis, format indisponible, permission manquante, doublon ou navigation modifiée, BGDD s’ouvre pour laisser choisir. Aucun raccourci global ni combinaison de touches n’est imposé.

**M’avertir** est désactivé par défaut. Une notification silencieuse signale la fin de la file, un échec ou un choix nécessaire, sans titre de vidéo. L’activation volontaire demande la permission Chrome ; un refus laisse BGDD silencieux. Les événements sont regroupés, sans répétition au redémarrage. Un clic ouvre BGDD sans lancer d’opération.

## Si une mise à jour refuse un lien symbolique

Si l’assistant indique « Lien symbolique non autorisé », il arrête la mise à jour en conservant les fichiers. Un cache de travail créé par Deno peut provoquer ce refus. Ne supprimez pas la carte Chrome ni vos données : faites vérifier ce cache avant de reprendre l’installation. Les réglages, l’historique et les fichiers téléchargés doivent être conservés.
