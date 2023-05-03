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
  *machines.target*. Le service *ovsdb-server* (qui est lié à *ovs-vswitchd) et la cible
  *machines.target* faisant parti de la *multi-user.target*, il peut être utile de placer des
  dépendances fonctionnelles (*Wants=*) et d'ordonnancement (*After=*) du service vis à vis de
  *machines.target*.

La plateforme est maintenant opérationnelle.
