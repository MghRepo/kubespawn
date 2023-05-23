# Bastion

## Installation

Créer le répertoire de la machine :
```bash,ignore
$ sudo mkdir /var/lib/machines/bastion
```

Installer ArchLinux et quelques paquets utiles :
```bash, ignore
$ sudo pacstrap -K -c /var/lib/machines/bastion/ base vim sudo man-db man-pages openssh
```

Première connexion, changer le mot de passe root et renseigner le nom d'hôte :
```bash,ignore
$ sudo machinectl start bastion
$ sudo machinectl shell bastion
$ passwd
$ hostnamectl set-hostname bastion
$ exit
```

Côté hôte, limiter l'utilisation des ressources du conteneur :
```bash,ignore
$ sudo systemctl set-property systemd-nspawn@bastion MemoryHigh=2G
$ sudo systemctl set-property systemd-nspawn@bastion CPUQuota=100%
```

> **Remarque** : ArchLinux utilise le module pam *securetty* afin de limiter les connexion du
  superutilisateur. Pour que le login root fonctionne il est necéssaire d'ajouter *pts/1* au fichier
  */etc/securetty*.
