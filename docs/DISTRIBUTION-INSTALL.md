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

## Mettre à jour, réparer ou désinstaller

**Maintenance…** permet de rechercher volontairement une mise à jour, de vérifier les composants, de réparer l’installation ou de la désinstaller. Les mises à jour ne s’installent pas automatiquement.

Après une mise à jour, actualisez la carte BGDD dans Chrome et rechargez les publications déjà ouvertes. Gardez la carte existante pour conserver ses réglages, autorisations et historique.

Pour désinstaller, ouvrez **Désinstaller BGDD.app** dans le DMG ou choisissez **Maintenance… → Désinstaller**, puis retirez la carte BGDD dans Chrome. L’effacement des préférences natives est facultatif ; Chrome supprime ses propres données lorsque l’extension est retirée. **Vos fichiers téléchargés sont conservés.**

Si la recherche de mises à jour d’une ancienne version ne fonctionne plus, [téléchargez la dernière version manuellement](https://github.com/enrimerveille/BGDD/releases), puis suivez les étapes ci-dessus sans supprimer l’extension.

[English installation instructions](../README.en.md#install) · [Licences et sources tierces](DISTRIBUTION-LICENSES.md)

## Anciennes versions

Depuis **0.4.8-rc.10 ou avant**, téléchargez manuellement le dernier DMG : l’ancien assistant refuse les paquets avec deux applications. Installez la mise à jour, puis actualisez la carte Chrome existante sans la supprimer.

## Formats locaux, file et notifications

Depuis un résultat terminé, **Autre format…** réutilise le fichier local et crée une nouvelle sortie sans écraser l’original. Les fichiers enregistrés avant 0.7.0 restent accessibles dans le Finder mais ne portent pas l’identité nécessaire au réexport sécurisé. Un fichier supprimé, modifié ou remplacé est refusé, sans téléchargement de remplacement. Audio original copie la piste de ce fichier ; sur une plateforme, il copie la meilleure piste accessible, pas un master de l’auteur. AAC est conservé en M4A, Opus dans un conteneur Opus/Ogg adapté ; un codec sans conteneur pris en charge est refusé sans conversion cachée.

L’avertissement de doublon compare publication, élément et format ; **Télécharger à nouveau** reste possible. Effacer l’historique conserve les fichiers et les opérations déjà autorisées, mais retire les anciennes références de réutilisation.

**Mettre la file en pause** laisse finir l’opération en cours. **Reprendre la file** autorise les suivantes. Une limitation HTTP 429 suspend seulement les prochains téléchargements du site concerné ; la reprise du site reste manuelle et respecte un éventuel délai serveur. Fermer Chrome interrompt les opérations sans reprise automatique.

Les réglages donnent accès à la page des raccourcis Chrome : attribuez votre combinaison à **Ouvrir BGDD**. Aucun raccourci global n’est imposé. Les notifications sont facultatives, désactivées par défaut, silencieuses lorsque Chrome et macOS le permettent. Leur activation demande la permission Chrome ; un refus laisse BGDD silencieux. Elles indiquent une fin de série ou une attention requise, sans dévoiler les titres. Un clic ouvre BGDD sans lancer d’opération.
