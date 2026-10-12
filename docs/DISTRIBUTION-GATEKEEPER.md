# Ouvrir BGDD avec Gatekeeper

BGDD est un logiciel indépendant distribué sans certificat Apple Developer ID et sans notarisation Apple. La signature ad hoc assure une cohérence technique des exécutables ; elle n’identifie pas Angry Thread auprès d’Apple. Les empreintes et HTTPS vérifient les fichiers attendus, sans constituer une approbation Apple ni une protection contre toute compromission du compte de distribution.

## Première ouverture

1. Télécharger le paquet d’une release BGDD approuvée, ouvrir le DMG, puis essayer d’ouvrir **BGDD Installer.app**.
2. Si une alerte indique qu’Apple ne peut pas vérifier le développeur ou la présence de logiciels malveillants, fermer l’alerte.
3. Ouvrir **Réglages Système → Confidentialité et sécurité**. Dans Sécurité, choisir **Ouvrir quand même** pour BGDD, lorsque ce bouton est proposé.
4. Confirmer personnellement **Ouvrir**. macOS peut demander une authentification.
5. Revenir à l’installateur, installer les composants, puis vérifier leur fonctionnement.

Ce parcours suit la [procédure officielle Apple](https://support.apple.com/fr-fr/102445). L’utilisateur prend lui-même la décision ; l’installateur ne simule pas cette autorisation.

## Si un composant reste bloqué

La vérification porte aussi sur les auxiliaires et les moteurs. Si macOS bloque un composant après l’installation, conserver le message et son nom, puis vérifier si **Ouvrir quand même** est proposé pour cet élément. Refaire ensuite **Vérifier les composants**. Un blocage persistant ne doit pas être présenté comme une installation réussie.

Si macOS indique que le logiciel est endommagé, modifié ou dangereux, ou si aucune autorisation officielle n’est proposée, arrêter le parcours et consulter les problèmes connus. L’autorisation manuelle d’une app non identifiée n’est pas une solution générale à toutes les alertes.

BGDD ne retire pas la quarantaine, ne désactive pas Gatekeeper, ne change pas les politiques du Mac ni les réglages de confidentialité. Un Mac géré peut interdire les exceptions. [État des recettes macOS 26 et 27](DISTRIBUTION-VALIDATION.md).
