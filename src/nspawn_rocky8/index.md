# Nspawn Rocky8

## Introduction

Pour créer notre premier conteneur, il existe un hub pour les images de conteneurs légers
systemd-nspawn [nspawn.org](https://nspawn.org).

Télécharger l'[image rocky8](https://hub.nspawn.org/storage/rocky/8/tar/image.tar.xz).

Créer le répertoire du conteneur :
```bash,ignore
sudo mkdir /var/lib/machines/rocky8
```

Extraire l'image dans le répertoire :
```bash,ignore
sudo tar -xvf ~/telechargements/image.tar.xz -C /var/lib/machines/rocky8/
```

Et démarrer le conteneur :
```bash,ignore
$ sudo machinectl start rocky8
```
