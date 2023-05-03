# Wireguard

## Chargement du module

Pour pouvoir utiliser un module du noyau dans les conteneurs, il est nécessaire des le charger au
niveau de l'hôte :

```bash,ignore
$ sudo modprobe wireguard
```

Afin de ne pas avoir à recharger le module à chaque redémarrage de l'hôte, on pourra l'inclure dans
les images initramfs. De multiples outils permettent la construction des initramfs :
* **mkinitcpio**
* **dracut**
* **booster**

ArchLinux utilise **mkinitcpio** par défaut.

Éditer le fichier */etc/mkinitcpio.conf* et ajouter le module wireguard :

```bash,ignore
modules=(wireguard)
```

Puis reconstruire les initramfs :

```bash,ignore
$ sudo mkinitcpio -P
```
