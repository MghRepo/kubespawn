# Nspawn Rocky8

## Construction de l'image et déploiement

Par la suite on sauvegardera l'image dans l'archive *rocky8.tar.xz* :
```bash,ignore
$ sudo tar -cJvf /var/lib/machines/rocky8.tar.xz -C /var/lib/machines/rocky8/ .
```

> **Remarque** : Cette opération peut prendre plusieurs minutes.

Par la suite 2 méthodes permettent la création des machines.

### Déploiement de l'image

On pourrait créer les répertoires des machines *infra*, *cnode* et *wnode* :
```bash,ignore
$ sudo mkdir /var/lib/machines/{infra,cnode,wnode}
```

Et copier la machine ou bien encore extraire l'image dans chacun de ces répertoires :
```bash,ignore
$ sudo tar -xvf /var/lib/machines/rocky8.tar.xz -C /var/lib/machines/infra/
$ sudo tar -xvf /var/lib/machines/rocky8.tar.xz -C /var/lib/machines/cnode/
$ sudo tar -xvf /var/lib/machines/rocky8.tar.xz -C /var/lib/machines/wnode/
```

### Clonage de la machine

Une meilleure méthode qui fait usage du système de fichier sous-jacent de l'hôte est de
simplement cloner la machine *rocky8*. En effet le système hôte utilise *btrfs* qui supporte les
*snapshots* et les *sous-volumes* et inclus tous les avantages du *copy-on-write* :
```bash,ignore
$ sudo machinectl clone rocky8 infra
$ sudo machinectl clone rocky8 cnode
$ sudo machinectl clone rocky8 wnode
  ```

  > **Remarque** : Une machine peut également être clonée en *read-only*.
