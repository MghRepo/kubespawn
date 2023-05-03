# Wnode

## Podman Crun et UBI

Installation des outils de conteneurisation :
```bash,ignore
$ sudo dnf module install container-tools
$ sudo dnf install podman
$ sudo dnf install crun
```

Récupérer l'image du conteneur UBI :
```bash,ignore
$ sudo podman pull registry.access.redhat.com/ubi8/ubi
```

Dans le fichier */etc/containers/containers.conf* changer la runtime :
```bash,ignore
runtime=crun
#runtime=runc
```

Exécuter le conteneur nommé *monUBI* :
```bash,ignore
$ sudo podman run --privileged --name=monUBI -it registry.access.redhat.com/ubi8/ubi /bin/bash
```

* L'option *-i* créé une session interactive. Sans l'option *-t*, le shell reste ouvert, mais on ne
  peut rien écrire au shell.
* L'option *-t* ouvre une session de terminal. Sans l'option *-i* le shell s'ouvre et quitte
  immédiatement.

A l'intérieur du conteneur, installer l'ensemble d'utilitaires systèmes *procps-ng* (*ps*, *top*,
*uptime*, etc.) :
```bash,ignore
$ dnf install procps-ng
```

Puis lister les processus courants :
```bash,ignore
$ ps -ef
```

Quitter pour retourner dans l'hôte et lister les conteneurs :
```bash,ignore
$ exit
$ sudo podman ps
```
