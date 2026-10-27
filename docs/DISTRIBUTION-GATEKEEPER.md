# Autoriser l’ouverture de BGDD sur macOS

BGDD est distribué **sans certificat Apple Developer ID et sans notarisation Apple**. macOS peut donc demander une autorisation pour l’installateur ou le moteur. Les empreintes SHA-256 permettent de vérifier les fichiers téléchargés ; elles ne constituent pas une approbation Apple.

## Première ouverture

1. Téléchargez le DMG depuis une [release officielle BGDD](https://github.com/enrimerveille/BGDD-downloads/releases), ouvrez-le et lancez **Installer BGDD.app**.
2. Si macOS indique qu’Apple ne peut pas vérifier le développeur ou l’absence de logiciels malveillants, fermez l’alerte.
3. Dans **Réglages Système → Confidentialité et sécurité**, choisissez **Ouvrir quand même** pour le composant BGDD concerné, lorsque cette option est proposée.
4. Confirmez **Ouvrir** et authentifiez-vous si macOS le demande, puis reprenez l’installation.

Cette autorisation vous appartient. Elle suit la [procédure officielle Apple](https://support.apple.com/fr-fr/102445). BGDD ne désactive pas Gatekeeper et ne supprime pas automatiquement la quarantaine.

## Préparer le moteur

À l’étape **Préparer le moteur**, choisissez **Ouvrir BGDD Engine**. Si macOS bloque le moteur ou un composant, notez le nom indiqué et suivez la même procédure pour cet élément. Relancez ensuite la préparation, puis revenez à l’assistant et choisissez **Vérifier le résultat**.

Pour rc.4 à rc.6, les commandes équivalentes sont **Ouvrir le moteur** puis **Vérifier les composants**, dans **BGDD Installer.app**.

## Si l’ouverture reste impossible

Si macOS signale un logiciel endommagé, modifié ou dangereux, ou si aucune autorisation n’est proposée, arrêtez l’installation et conservez le message exact. Un Mac géré par une organisation peut interdire ces exceptions. Consultez les [instructions Apple](https://support.apple.com/fr-fr/102445) ou demandez de l’aide à votre administrateur.

[Revenir au guide d’installation](DISTRIBUTION-INSTALL.md)

## English

BGDD has **no Apple Developer ID certificate or Apple notarization**. Download it from the official releases page. If macOS blocks **Installer BGDD.app** or **BGDD Engine.app**, dismiss the alert, open **System Settings → Privacy & Security**, and select **Open Anyway** for the named component when offered. Confirm **Open**, authenticate if requested, then retry the installation step.

The decision is yours; BGDD does not disable Gatekeeper or remove quarantine automatically. Checksums verify downloaded files, not Apple approval. If macOS reports damaged, modified or dangerous software, or offers no exception, stop and keep the exact message. Managed Macs may prohibit exceptions. [Apple’s instructions](https://support.apple.com/en-us/102445).
