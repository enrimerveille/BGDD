# BGDD 0.4.8-rc.7 — Apple Silicon et Intel

Une seule release, deux DMG : **Apple Silicon / ARM64 sous macOS 27**, **Intel / x86_64 sous macOS 26**.

- Un seul installateur visible dans le DMG ; assistant en quatre étapes, aide et licences intégrées, apparence claire/sombre automatique.
- Chrome affiche **« Téléchargement en cours »** ; le libellé accessible devient **« Progression du téléchargement »**. Préparation, conversion, extraction audio et assemblage gardent leurs messages. Aucune logique de téléchargement modifiée.
- Mise à jour transactionnelle et actualisation de la carte Chrome existante, avec conservation de son ID, des autorisations, des réglages, de l’historique et des médias.

## Télécharger

| Mac | Fichier | SHA-256 |
|---|---|---|
| Apple Silicon, macOS 27 | [BGDD-macOS-arm64.dmg](https://github.com/enrimerveille/BGDD-downloads/releases/download/v0.4.8-rc.7/BGDD-macOS-arm64.dmg) | `8d6713c8745b3fccc356f5eb16607def50d492cde6d11a904b82dd03da955a16` |
| Intel, macOS 26 | [BGDD-macOS-x86_64.dmg](https://github.com/enrimerveille/BGDD-downloads/releases/download/v0.4.8-rc.7/BGDD-macOS-x86_64.dmg) | `2acc7df861ee7de415b0a56097ce3ba29edb4924c61a56f231b5334a47288e1d` |

Ouvrir **Installer BGDD.app** et suivre ses quatre étapes. Pour mettre à jour Chrome, **Actualiser** la carte BGDD existante, sans la supprimer. Le [guide d’installation](https://github.com/enrimerveille/BGDD-downloads/blob/main/docs/DISTRIBUTION-INSTALL.md) détaille chaque étape.

## Validation et limites

ARM : paquet exact contrôlé, installation/maintenance du payload en environnement isolé, réception Safari avec quarantaine normale et ouverture du vrai installateur après autorisation Gatekeeper humaine sous macOS 27.2. La recette graphique RC.7 déjà acquise est réutilisée ; l’alignement personnel et le contrôle final Chrome suivent la publication. Les moteurs et formats inchangés conservent leurs preuves antérieures ; les quatre téléchargements réseau ne sont pas répétés.

Intel : sept Mach-O x86_64, inventaires, signatures techniques, licences, sources correspondantes et empreintes du nouveau paquet vérifiés. Les essais physiques antérieurs sous macOS 26.5.2 couvrent installation, Gatekeeper, moteur, quatre formats réseau, annulation, mise à jour et désinstallation. Le propriétaire confirme également le fonctionnement antérieur de Chrome le 27 octobre 2026 ; cette confirmation complète le rapport historique qui laissait ce parcours non testé. **La nouvelle interface RC.7 n’a pas été exécutée sur Intel.** Publication sans nouvelle session physique explicitement autorisée. Compilation croisée et simulation de sélection d’asset ne constituent pas une exécution native Intel. ARM sur macOS 26 reste non qualifié.

BGDD reste sans Developer ID ni notarisation Apple ; toute autorisation macOS est personnelle. La validation exhaustive VoiceOver, les erreurs/focus de la nouvelle interface sur Intel et une assertion EJS indépendante sur le Mac Intel restent limitées. [Preuves détaillées](https://github.com/enrimerveille/BGDD-downloads/blob/main/docs/DISTRIBUTION-VALIDATION.md).

`SHA256SUMS` couvre les deux DMG, les deux kits `BGDD-third-party-sources-arm64.zip` / `BGDD-third-party-sources-x86_64.zip`, `VERSIONS-arm64.json`, `VERSIONS-x86_64.json`, le manifeste commun `VERSIONS.json` et `RELEASE-ASSETS.json`. Les kits contiennent uniquement les sources tierces correspondantes. Le dépôt source BGDD reste privé. Les releases antérieures sont conservées.

**GitHub Actions supplémentaire : 0 € ; aucun workflow lancé.**

English: choose ARM64 for Apple Silicon on macOS 27, or x86_64 for Intel on macOS 26. The new four-step RC.7 interface has not been executed on Intel; previous physical 26.5.2 evidence and the owner’s Chrome confirmation are reused with explicit publication approval. Open Installer BGDD.app, follow the assistant, and reload the existing Chrome extension without removing it. [English guide](https://github.com/enrimerveille/BGDD-downloads/blob/main/README.en.md).
