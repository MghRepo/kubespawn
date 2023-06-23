# Nspawn Rocky8

## Préparation de l'image

Première connexion :
```bash,ignore
$ sudo machinectl shell rocky8
```

Renseigner la variable d'environnement TERM (le défaut *vt220* ne convient pas) :
```bash,ignore
$ TERM=vt100
$ echo "TERM=vt100" >/etc/environment
```

Mettre à jour le système et le mot de passe root :
```bash,ignore
$ rpmdb --rebuilddb
$ dnf update
$ dnf install passwd
$ passwd
```

Installer quelques paquets utiles et créer un utilisateur administrateur *cloudadm* :
```bash,ignore
$ dnf install epel-release
$ dnf install sudo vim man man-pages htop
$ dnf install NetworkManager-tui openssh-server openssh-clients rsync
$ dnf clean all
$ useradd -m cloudadm
$ vim /etc/sudoers
```
Ajouter le groupe *cloudadm* au groupe des administrateurs.

Enfin, permettre aux utilisateurs non privilégiés d'utiliser la commande ping et éteindre la machine:
```bash,ignore
$ setcap cap_net_raw+pe /bin/ping
$ poweroff
```

> **Remarque** : À partir de maintenant pour les sous-commandes *machinectl login* et *machinectl
  shell* on s'authentifiera avec l'utilisateur *cloudadm*.
