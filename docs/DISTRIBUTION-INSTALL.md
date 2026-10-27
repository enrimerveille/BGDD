# Installer et entretenir BGDD

BGDD gratuit et propriétaire · Angry Thread · extension **0.4.8** · composant natif **0.3.5** · protocole **2**.

Choisir le paquet correspondant au processeur :

- **Apple Silicon : [0.4.8-rc.6](https://github.com/enrimerveille/BGDD-downloads/releases/tag/v0.4.8-rc.6), macOS 27 uniquement.** macOS 26 ARM reste non qualifié.
- **Intel x86_64 : [0.4.8-rc.5](https://github.com/enrimerveille/BGDD-downloads/releases/tag/v0.4.8-rc.5), macOS 26**, test physique sous macOS 26.5.2. Installation, moteur, quatre formats réseau, annulation, mise à jour et désinstallation réussis. **Chrome → Native Messaging → téléchargement sur Intel NON TESTÉ** ; cette limite est acceptée pour la préversion.

Le paquet Intel exact conserve son numéro rc.5 ; il ne remplace pas la rc.6 ARM. Le paquet est sans Developer ID ni notarisation ; [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) explique le mécanisme manuel officiel lorsqu’il est proposé. [Preuves et limites](DISTRIBUTION-VALIDATION.md).

## Première installation

1. Télécharger **BGDD-macOS-arm64.dmg** pour Apple Silicon ou **BGDD-macOS-x86_64.dmg** pour Intel d’une release approuvée sur [BGDD-downloads](https://github.com/enrimerveille/BGDD-downloads/releases).
2. Ouvrir l’image puis **BGDD Installer.app**. Si macOS bloque cette première ouverture, suivre le guide Gatekeeper et confirmer vous-même l’ouverture.
3. Choisir **Installer / Mettre à jour**. Une connexion Internet est nécessaire pour récupérer yt-dlp **2026.08.19** et Deno **2.9.7** directement depuis leurs releases officielles. Leur version et leur SHA-256 sont fixes. L’installateur affiche la source et les octets réellement reçus ; aucun script distant n’est exécuté.
4. Choisir **Ouvrir le moteur**. La fenêtre **BGDD — préparer le moteur** vérifie successivement les versions de yt-dlp, Deno, FFmpeg et ffprobe, sans télécharger de média. La séquence s’arrête au premier échec. Si macOS bloque un composant, prendre vous-même la décision d’ouverture officielle décrite dans le guide Gatekeeper, puis rouvrir le moteur pour refaire la vérification.
5. Choisir **Vérifier les composants** et attendre un résultat complet. Ce contrôle d’intégrité est distinct de l’autorisation de lancement par macOS.
6. Choisir **Préparer Chrome**. Finder montre le dossier ; l’adresse **chrome://extensions** est copiée.
7. Dans Chrome, coller cette adresse, activer **Mode développeur**, choisir **Charger l’extension non empaquetée**, puis sélectionner le dossier **extension** montré par l’installateur.
8. Ouvrir BGDD, puis **Réglages → Vérifier l’installation**. Le diagnostic doit indiquer moteur **0.3.5**, protocole **2** et composants prêts. Un auxiliaire peut aussi demander une décision Gatekeeper personnelle à cette étape.

Aucun Terminal, Homebrew, Python ou Node.js séparé. L’installation utilise le dossier utilisateur stable **~/Library/Application Support/BGDD/extension** et le manifest Native Messaging officiel de Chrome. Vous n’avez pas à saisir ces chemins. L’installateur refuse une ancienne installation dont il ne peut pas établir la propriété.

L’ID attendu est **ipjganpibkpndaibhejdcnbdclekogbl**. Le chargement local est une méthode normalement destinée au développement : il reste manuel, sans installation silencieuse, sans modification des fichiers internes de Chrome ni mises à jour automatiques Chrome Web Store.

## Télécharger

Ouvrir une publication accessible, choisir son format et sa destination, puis **Télécharger**. Le moteur reçoit les médias directement sur le Mac ; les données vidéo ne transitent pas par Chrome. L’accès facultatif à une session de site exige un consentement explicite dans les réglages.

**Annuler** arrête le groupe de processus de la tâche. Fermer le popup laisse le transfert continuer ; fermer Chrome l’interrompt sans reprise automatique. La réussite attend ffprobe et la publication sans écrasement. Les garanties et limites APFS/exFAT restent celles du produit 0.4.8.

## Mettre à jour

1. Attendre la fin des transferts et ouvrir l’installateur.
2. Choisir **Chercher une mise à jour**. La recherche volontaire utilise **BGDD-downloads**, vérifie version, HTTPS, taille, empreintes et contenu attendu. L’absence de Developer ID limite l’authenticité : l’empreinte est fournie par le même compte GitHub que le fichier.
3. Choisir d’ouvrir le paquet vérifié, confirmer son ouverture si macOS le demande, puis choisir **Installer / Mettre à jour** dans le nouvel installateur.
4. Choisir **Ouvrir le moteur**, terminer la vérification des quatre outils et décider personnellement des éventuelles ouvertures demandées par macOS, puis vérifier les composants.
5. Dans Chrome, choisir **Actualiser** sur la carte BGDD existante, puis recharger les publications déjà ouvertes.

Le chemin, l’identité, les préférences, autorisations, historique et médias sont conservés. La réparation peut exiger Internet pour les versions fixes des moteurs. Aucun script distant, installation silencieuse, recherche périodique ni connexion permanente à GitHub. Le canal public sélectionne les préversions compatibles avec l’architecture depuis la liste des releases, avec vérification des empreintes.

## Désinstaller

1. Supprimer BGDD dans **chrome://extensions**.
2. Ouvrir l’installateur conservé, laisser décoché **Supprimer aussi préférences et historique** pour garder les données natives, puis choisir **Désinstaller**.
3. Cocher cette option uniquement si vous souhaitez effacer les données natives BGDD.

Host, gardien, sélecteur, extension, manifest et moteurs propres à BGDD sont retirés. Les médias téléchargés et outils d’autres applications restent en place. Chrome retire ses propres données lorsque son extension est supprimée ; l’option de l’installateur concerne les données natives.

## Si une opération échoue

L’installateur conserve ou restaure la version précédente lorsque sa transaction échoue. Rouvrir l’installateur et vérifier les composants. Si la préparation du moteur s’arrête, conserver le nom de l’outil et le message affiché, puis suivre [Gatekeeper](DISTRIBUTION-GATEKEEPER.md) lorsqu’une autorisation officielle est proposée. Ne supprimer aucun dossier personnel pour réparer BGDD. Dossier inaccessible, volume absent et disque plein ont des messages distincts. Ne pas modifier PATH, les réglages du shell ou les politiques de sécurité.
