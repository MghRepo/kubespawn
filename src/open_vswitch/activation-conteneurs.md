## Activation des conteneurs

Suite à la connexion des machines, il peut être souhaitable d'activer leurs unités de services afin
qu'elles se lancent au démarrage de l'hôte :

```bash,ignore
sudo systemctl enable systemd-nspawn@bastion
sudo systemctl enable systemd-nspawn@infra
sudo systemctl enable systemd-nspawn@cnode
sudo systemctl enable systemd-nspawn@wnode
```

> **Remarque** : Les unités de service *systemd-nspawn@* font partie de la cible spéciale systemd
  *machines.target* (pour en savoir plus sur les cibles spéciales fournies *man systemd.special*).
  Il est possible (mais pas forcément nécessaire) de modifier les dépendances fonctionnelles
  (*Wants=* et *Requires=*) et d'ordonnancement (*After*=) du service *ovs-vswitchd* et copiant le
  fichier d'unité dans */etc/systemd/system/* afin de le lier à la cible *machines.target* (pour en
  savoir plus sur la rédaction de fichiers d'unités *man systemd.unit*).

La plateforme est maintenant opérationnelle.
