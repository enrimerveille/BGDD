# Installer et utiliser BGDD

BGDD 0.4.8-rc.9 est disponible pour **Apple Silicon (ARM64) sous macOS 27** et **Intel (x86_64) sous macOS 26**. [Choisir votre DMG](https://github.com/enrimerveille/BGDD/releases/tag/v0.4.8-rc.9).

Une connexion Internet et Google Chrome sont nécessaires. Aucun Terminal, Homebrew, Python ou Node.js à installer. BGDD est distribué **sans certificat Developer ID ni notarisation Apple** : consultez le [guide Gatekeeper](DISTRIBUTION-GATEKEEPER.md) si macOS bloque l’ouverture.

## Installer en quatre étapes

Ouvrez le DMG, puis **Installer BGDD.app**.

1. **Installer BGDD** ou **Mettre à jour BGDD** : l’assistant installe les composants nécessaires et conserve vos réglages, votre historique et le dossier de l’extension. Les moteurs supplémentaires sont téléchargés depuis leurs éditeurs, avec vérification d’intégrité.
2. **Préparer le moteur** : choisissez **Ouvrir BGDD Engine**. Après la préparation, revenez à l’assistant et choisissez **Vérifier le résultat**. Si macOS bloque un composant, suivez le guide Gatekeeper, puis recommencez cette étape.
3. **Ajouter à Chrome** : choisissez **Ouvrir les extensions Chrome**. Lors de la première installation, activez **Mode développeur**, cliquez **Charger l’extension non empaquetée** et sélectionnez le dossier indiqué. Pour une mise à jour, choisissez **BGDD est déjà dans Chrome** si nécessaire, puis **Actualiser** sur la carte BGDD existante, sans la supprimer. Dans BGDD → Réglages, choisissez **Vérifier l’installation**, fermez le popup, puis revenez à l’assistant et cliquez **Vérifier la connexion**.
4. **BGDD est prêt** : lorsque les étapes affichent **Terminé**, cliquez **Terminer**.

Le dossier de l’extension est `~/Library/Application Support/BGDD/extension`. L’extension se charge manuellement et ne reçoit pas les mises à jour du Chrome Web Store.

## Télécharger

Ouvrez une publication YouTube, X, Instagram ou TikTok, puis BGDD. Choisissez le format et le dossier de destination, puis **Télécharger**. Sur X, le bouton **B** lance directement la qualité maximale.

Un téléchargement est actif à la fois. **Annuler** arrête le transfert et son traitement. Fermer le popup laisse le téléchargement continuer ; quitter Chrome l’interrompt sans reprise automatique. Les fichiers existants ne sont jamais écrasés. Sur exFAT, attendez la confirmation de réussite avant d’ouvrir le fichier.

L’accès à une session de plateforme est facultatif : il se donne et se retire dans les réglages BGDD pour le site concerné. La disponibilité dépend de la publication et des restrictions de la plateforme. Téléchargez uniquement les contenus que vous êtes autorisé à conserver.

## Mettre à jour, réparer ou désinstaller

**Maintenance…** permet de rechercher volontairement une mise à jour, de vérifier les composants, de réparer l’installation ou de la désinstaller. Les mises à jour ne s’installent pas automatiquement.

Après une mise à jour, actualisez la carte BGDD dans Chrome et rechargez les publications déjà ouvertes. Gardez la carte existante pour conserver ses réglages, autorisations et historique.

Pour désinstaller, retirez BGDD dans Chrome puis choisissez **Maintenance… → Désinstaller**. L’effacement des préférences natives est facultatif ; Chrome supprime ses propres données lorsque l’extension est retirée. **Vos fichiers téléchargés sont conservés.**

Si la recherche de mises à jour d’une ancienne version ne fonctionne plus, [téléchargez la dernière version manuellement](https://github.com/enrimerveille/BGDD/releases), puis suivez les étapes ci-dessus sans supprimer l’extension.

## Versions rc.4 à rc.6

Ces versions utilisent **Installer BGDD.app**. Choisissez **Installer / Mettre à jour**, puis **Ouvrir le moteur** et **Vérifier les composants**. **Préparer Chrome** indique le dossier à charger. Pour une mise à jour, actualisez la carte BGDD existante. Les compatibilités propres à chaque version sont indiquées sur sa page de téléchargement.

[English installation instructions](../README.en.md#install) · [Licences et sources tierces](DISTRIBUTION-LICENSES.md)

## Désinstaller et mettre à jour depuis une ancienne version

Ouvrez **Désinstaller BGDD.app** dans le DMG. Attendez la fin des transferts, puis confirmez la suppression. Les téléchargements restent conservés ; la case facultative efface uniquement les réglages et l’historique natifs. Retirez ensuite BGDD dans Chrome pour gérer ses données navigateur.

Depuis **0.4.8-rc.10 ou avant**, téléchargez manuellement le DMG de 0.5.0 : l’ancien assistant refuse les paquets avec deux applications. Installez la mise à jour, puis actualisez la carte Chrome existante sans la supprimer.
