# Systemd-nspawn

## Introduction

Systemd-nspawn virtualise la hiérarchie du système de fichier, l'arbre des processus, les différents
sous-systèmes IPC ainsi que les noms de domaine et d'hôte.

Systemd-nspawn peut être invoqué sur n'importe quel répertoire de l'arborescence contenant un arbre
de système d'exploitation.

A l'instar de chroot, systemd-nspawn peut être utilisé pour faire fonctionner des systèmes
d'exploitation Linux dans un conteneur.

Les usages de systemd-nspawn peuvent être multiples tels que :
* Créer des paquets d'autres distributions.
* Exécuter des applicatifs sensibles dans un environnement isolé.

Mais systemd-nspawn retient également les avantages de la conteneurisation tels que :
* Portabilité
* Scalabilité
