# Systemd-nspawn

## Gestion

Les conteneurs situés dans **/var/lib/machines/** peuvent être contrôlés par la commande
**machinectl** qui contrôle en interne les instances des unités de service
**systemd-nspawn@nomConteneur**.

> **Remarque** : Les sous répertoires correspondent aux noms des conteneurs c'est à dire :
  */var/lib/machines/nomConteneur/*.

### Chaîne d'outils systemd

Une grande partie de la chaîne d'outils systemd a été adaptée pour fonctionner avec les conteneurs.
Ces outils fournissent généralement une option *-M* qui prendra un nom de conteneur en argument :

```bash,ignore
$ sudo journalctl -M nomConteneur # Les journals de logs
$ systemd-cgls -M nomConteneur # Le contenu des cgroups
$ systemd-analyze -M nomConteneur # Le temps de démarrage
$ systemd-cgtop # Une vue globale de l'usage des ressources
```
### Machinectl

Pour la gestion des conteneurs on utilise la commande *machinectl*.

*machinectl* est généralement suffixée d'une sous-commande suivi du nom du conteneur. Par exemple :
```bash,ignore
$ machinectl start nomConteneur
```

> **Remarque** : Les noms de conteneurs ne doivent contenir que des caractères ASCII (pas
  d'underscore).

Les sous-commandes communes sont :
* poweroff - désactiver un ou plusieurs conteneurs
* reboot - redémarrer un ou plusieurs conteneurs
* status - affiche des informations relatives au statut d'exécution d'un ou plusieurs conteneurs
* show - affiche des propriétés du gestionnaire ou d'un ou plusieurs conteneurs
* list - affiche une liste des conteneurs actuellement en exécution
* login *nomConteneur* - ouvrir une session de connexion interactive
* shell *[utilisateur@]nomConteneur* - ouvrir une session shell interactive
* enable/disable *nomConteneur* - activer ou désactiver le service du conteneur.

*machinectl* a également des commandes pour la gestion des images et des transferts d'images
(ex. *clone*).
