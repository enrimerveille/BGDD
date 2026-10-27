# Installer et entretenir BGDD 0.4.8-rc.7

Angry Thread · logiciel gratuit et propriétaire · extension 0.4.8 · protocole 2.

Choisissez **BGDD-macOS-arm64.dmg** pour Apple Silicon sous macOS 27 ou **BGDD-macOS-x86_64.dmg** pour Intel sous macOS 26, dans la [même release](https://github.com/enrimerveille/BGDD-downloads/releases/tag/v0.4.8-rc.7). Le minimum technique du paquet est macOS 26 ; ARM sur 26 reste non qualifié. La nouvelle interface RC.7 n’a pas été exécutée sur Intel. [Validation](DISTRIBUTION-VALIDATION.md).

## Les quatre étapes

Ouvrez le DMG puis son unique application **Installer BGDD.app**. Si macOS bloque son ouverture, suivez personnellement le [guide Gatekeeper](DISTRIBUTION-GATEKEEPER.md). BGDD est distribué sans Developer ID ni notarisation. Aucune protection n’est désactivée.

1. **Installer BGDD** ou **Mettre à jour BGDD** : l’installation transactionnelle conserve préférences, historique et dossier de l’extension. Internet sert à récupérer yt-dlp 2026.08.19 et Deno 2.9.7 depuis leurs releases officielles, avec empreintes fixes.
2. **Préparer le moteur** : choisir **Ouvrir BGDD Engine**. La fenêtre vérifie yt-dlp, Deno, FFmpeg et ffprobe sans télécharger de média. Une éventuelle décision macOS reste personnelle. Revenir à l’assistant et choisir **Vérifier le résultat**.
3. **Ajouter à Chrome** : choisir **Ouvrir les extensions Chrome**. Première installation : activer le mode développeur, choisir **Charger l’extension non empaquetée** et sélectionner le dossier montré. Mise à jour : choisir **BGDD est déjà dans Chrome** si nécessaire, puis **Actualiser** sur la carte BGDD existante. Ne pas supprimer cette carte. Dans BGDD → Réglages, choisir **Vérifier l’installation**, fermer le popup, revenir à l’assistant et choisir **Vérifier la connexion**.
4. **BGDD est prêt** : les étapes affichent **Terminé** seulement après les contrôles d’installation, du moteur et de la connexion Chrome. Choisir **Terminer**.

L’ID reste **ipjganpibkpndaibhejdcnbdclekogbl** et le dossier **~/Library/Application Support/BGDD/extension**. Aucun Terminal, Homebrew, Python ou Node.js séparé. Le chargement local de Chrome reste manuel et ne fournit pas de mise à jour Chrome Web Store. L’installateur n’édite pas les fichiers internes du profil Chrome.

## Télécharger et mettre à jour

Ouvrez une publication compatible, choisissez format et destination, puis **Télécharger**. Un transfert actif à la fois ; la réussite attend ffprobe et la publication sans écrasement. **Annuler** arrête tout le groupe de processus. Aucun média ne transite par Chrome. L’accès facultatif à une session exige un consentement explicite.

Dans **Maintenance…**, la recherche de mise à jour est volontaire. L’updater choisit le DMG de l’architecture du Mac dans la release commune et contrôle HTTPS, version, taille, SHA-256 et contenu. Il n’existe ni daemon, ni recherche périodique, ni installation silencieuse. Les empreintes proviennent du même compte GitHub que les fichiers ; elles ne remplacent pas une identité Apple.

Une mise à jour conserve la carte Chrome, ses autorisations, réglages et historique. Actualisez cette carte et rechargez ensuite les publications déjà ouvertes. Les téléchargements restent en place.

## Retirer ou réparer

**Maintenance…** regroupe vérification, réparation et désinstallation. Une erreur de transaction conserve ou restaure l’installation précédente. Ne supprimez pas de dossier personnel pour réparer BGDD.

Pour désinstaller, retirez BGDD dans Chrome puis utilisez **Maintenance… → Désinstaller**. L’effacement des préférences natives est un choix explicite ; Chrome supprime ses propres données quand sa carte est retirée. Les médias téléchargés sont toujours conservés.
