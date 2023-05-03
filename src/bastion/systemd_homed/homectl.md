# Bastion

## Systemd-homed

### Homectl

*homectl* est l'outil principal que l'on utilise pour homed. On peut créer, mettre à jour et
inspecter des utilisateur, leurs répertoires home, et leurs fichier *~/.indentity* contrôlés par le
service *systemd-homed*.

Afin de créer l'utilisateur du *bastion* :
```bash,ignore
$ homectl create hugo
```

Cette commandee va créer :
* un utilisateur,
* un UID libre (dans les 60001 : 60513),
* créer un groupe avec le même nom et un GID égal à l'UID choisi et ajouter l'utilisateur spécifié
  comme membre,
* renseigner le shell par défaut de l'utilisateur à */bin/bash*.

Le point de montage du répertoire home est mis à */home/hugo*. Le mécanisme de stockage est choisi
dans cet ordre :

1. **LUKS** si supporté;
2. **Sous-volume** si LUKS n'est pas supporté et sous-volume est supporté;
3. **Répertoire** si aucun de ceux-ci n'est supporté.

> Remarque : le chemin de l'image pour le mécanisme LUKS est */home/hugo.home* et le chemin du
  répertoire pour le mécanisme répertoire est */home/hugo/home.dir*.
