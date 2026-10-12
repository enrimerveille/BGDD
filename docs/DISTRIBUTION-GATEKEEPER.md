# Ouvrir BGDD avec Gatekeeper

BGDD est un logiciel indépendant distribué sans certificat Apple Developer ID et sans notarisation Apple. La signature ad hoc assure une cohérence technique des exécutables ; elle n’identifie pas Angry Thread auprès d’Apple. Les empreintes et HTTPS vérifient les fichiers attendus, sans constituer une approbation Apple ni une protection contre toute compromission du compte de distribution.

## Première ouverture

1. Télécharger le paquet d’une release BGDD approuvée, ouvrir le DMG, puis essayer d’ouvrir **BGDD Installer.app**.
2. Si une alerte indique qu’Apple ne peut pas vérifier le développeur ou la présence de logiciels malveillants, fermer l’alerte.
3. Ouvrir **Réglages Système → Confidentialité et sécurité**. Dans Sécurité, choisir **Ouvrir quand même** ou **Autoriser quand même**, selon la version de macOS, pour le composant BGDD nommé dans l’alerte, lorsque ce bouton est proposé.
4. Confirmer personnellement **Ouvrir**. macOS peut demander une authentification.
5. Revenir à l’installateur et choisir **Installer / Mettre à jour**, puis **Ouvrir le moteur** et **Vérifier les composants**.

Ce parcours suit la [procédure officielle Apple](https://support.apple.com/fr-fr/102445). L’utilisateur prend lui-même la décision ; l’installateur ne simule pas cette autorisation.

## Préparation du moteur rc3

Après l’installation, **Ouvrir le moteur** ouvre la fenêtre **BGDD — préparer le moteur**. Cette étape prévue pour rc3 vérifie ponctuellement, sans média ni connexion réseau, les versions de **yt-dlp**, puis **FFmpeg**, puis **ffprobe**. Elle s’arrête au premier échec et affiche l’outil concerné. Sa qualification avec le paquet rc3 final et l’interface reste à établir ; l’essai privé d’un prototype ne constitue pas cette qualification.

Si macOS bloque **BGDD Engine**, fermer l’alerte et décider personnellement de son ouverture dans **Confidentialité et sécurité**, lorsque l’option officielle est proposée. Après confirmation, revenir à **Ouvrir le moteur**. FFmpeg et ffprobe restent des exécutables séparés : macOS peut demander une décision pour chacun. Après une autorisation personnelle, rouvrir le moteur pour refaire la séquence ; une autorisation de l’app ne prouve pas à elle seule l’autorisation de tous les outils.

La confirmation des trois vérifications prépare le parcours, sans prouver un téléchargement complet. Revenir ensuite à **Vérifier les composants**, puis au diagnostic Chrome et à un téléchargement autorisé.

## Si un composant reste bloqué

La vérification porte aussi sur les auxiliaires et les moteurs. Si macOS bloque un composant après l’installation, conserver le message et son nom, puis vérifier si **Ouvrir quand même** ou **Autoriser quand même** est proposé pour cet élément. Les recettes antérieures ont notamment rencontré des contrôles du host, du gardien, du sélecteur et des outils média. Chaque exception doit être décidée par l’utilisateur pour le composant nommé. Relancer ensuite la préparation du moteur ou l’action Chrome qui a été bloquée.

**Vérifier les composants** contrôle les fichiers, leurs empreintes et l’enregistrement Chrome. Ce contrôle seul ne prouve pas que macOS autorise leur lancement : vérifier ensuite la communication Chrome et un téléchargement autorisé. Un blocage persistant ne doit pas être présenté comme un parcours fonctionnel validé.

Si macOS indique que le logiciel est endommagé, modifié ou dangereux, ou si aucune autorisation officielle n’est proposée, arrêter le parcours et consulter les problèmes connus. L’autorisation manuelle d’une app non identifiée n’est pas une solution générale à toutes les alertes.

BGDD ne retire pas la quarantaine, ne désactive pas Gatekeeper, ne change pas les politiques du Mac ni les réglages de confidentialité. Un Mac géré peut interdire les exceptions. [État des recettes macOS 26 et 27](DISTRIBUTION-VALIDATION.md).
