# Installer et entretenir BGDD

BGDD gratuit et propriétaire · Angry Thread · candidate **0.4.8-rc.2** · extension **0.4.8** · composant natif **0.3.4** · protocole **2**.

Le dépôt de distribution est préparé en privé. La cible est macOS 26 et 27 Apple Silicon ; les résultats effectivement observés sont distingués dans [Validation](DISTRIBUTION-VALIDATION.md). Aucun support Intel. Le paquet est sans Developer ID ni notarisation ; [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) explique le mécanisme manuel officiel lorsqu’il est proposé.

## Première installation

1. Télécharger **BGDD-macOS-arm64.dmg** d’une release approuvée sur [BGDD-downloads](https://github.com/enrimerveille/BGDD-downloads/releases).
2. Ouvrir l’image puis **BGDD Installer.app**. Si macOS bloque cette première ouverture, suivre le guide Gatekeeper et confirmer vous-même l’ouverture.
3. Choisir **Installer / Mettre à jour**. Une connexion Internet est nécessaire pour récupérer yt-dlp **2026.08.19** et Deno **2.9.7** directement depuis leurs releases officielles. Leur version et leur SHA-256 sont fixes. L’installateur affiche la source et les octets réellement reçus ; aucun script distant n’est exécuté.
4. Choisir **Vérifier les composants** et attendre un résultat complet. Si un auxiliaire est bloqué par macOS, suivre le message et le guide ; ne supprimer aucun attribut de sécurité.
5. Choisir **Préparer Chrome**. Finder montre le dossier ; l’adresse **chrome://extensions** est copiée.
6. Dans Chrome, coller cette adresse, activer **Mode développeur**, choisir **Charger l’extension non empaquetée**, puis sélectionner le dossier **extension** montré par l’installateur.
7. Ouvrir BGDD, puis **Réglages → Vérifier l’installation**. Le diagnostic doit indiquer moteur **0.3.4**, protocole **2** et composants prêts.

Aucun Terminal, Homebrew, Python ou Node.js séparé. L’installation utilise le dossier utilisateur stable **~/Library/Application Support/BGDD/extension** et le manifest Native Messaging officiel de Chrome. Vous n’avez pas à saisir ces chemins. L’installateur refuse une ancienne installation dont il ne peut pas établir la propriété.

L’ID attendu est **ipjganpibkpndaibhejdcnbdclekogbl**. Le chargement local est une méthode normalement destinée au développement : il reste manuel, sans installation silencieuse, sans modification des fichiers internes de Chrome ni mises à jour automatiques Chrome Web Store.

## Télécharger

Ouvrir une publication accessible, choisir son format et sa destination, puis **Télécharger**. Le moteur reçoit les médias directement sur le Mac ; les données vidéo ne transitent pas par Chrome. L’accès facultatif à une session de site exige un consentement explicite dans les réglages.

**Annuler** arrête le groupe de processus de la tâche. Fermer le popup laisse le transfert continuer ; fermer Chrome l’interrompt sans reprise automatique. La réussite attend ffprobe et la publication sans écrasement. Les garanties et limites APFS/exFAT restent celles du produit 0.4.8.

## Mettre à jour

1. Attendre la fin des transferts et ouvrir l’installateur.
2. Choisir **Chercher une mise à jour**. La recherche volontaire utilise **BGDD-downloads**, vérifie version, HTTPS, taille, empreintes et contenu attendu. L’absence de Developer ID limite l’authenticité : l’empreinte est fournie par le même compte GitHub que le fichier.
3. Choisir d’ouvrir le paquet vérifié, confirmer son ouverture si macOS le demande, puis choisir **Installer / Mettre à jour** dans le nouvel installateur.
4. Dans Chrome, choisir **Actualiser** sur la carte BGDD existante, puis recharger les publications déjà ouvertes.

Le chemin, l’identité, les préférences, autorisations, historique et médias sont conservés. La réparation peut exiger Internet pour les versions fixes des moteurs. Aucun script distant, installation silencieuse, recherche périodique ni connexion permanente à GitHub. Tant que la vitrine reste privée, le canal public ne fournit pas de release au logiciel.

## Désinstaller

1. Supprimer BGDD dans **chrome://extensions**.
2. Ouvrir l’installateur conservé, laisser décoché **Supprimer aussi préférences et historique** pour garder les données natives, puis choisir **Désinstaller**.
3. Cocher cette option uniquement si vous souhaitez effacer les données natives BGDD.

Host, gardien, sélecteur, extension, manifest et moteurs propres à BGDD sont retirés. Les médias téléchargés et outils d’autres applications restent en place. Chrome retire ses propres données lorsque son extension est supprimée ; l’option de l’installateur concerne les données natives.

## Si une opération échoue

L’installateur conserve ou restaure la version précédente lorsque sa transaction échoue. Rouvrir l’installateur et vérifier les composants. Ne supprimer aucun dossier personnel pour réparer BGDD. Dossier inaccessible, volume absent et disque plein ont des messages distincts. Ne pas modifier PATH, les réglages du shell ou les politiques de sécurité.
