# Préface

La **conteneurisation** est une technologie open source qui permet d'emballer et de fournir des
applications. Elle permet de combiner une **isolation logicielle** avec la flexibilité des méthodes
de **déploiement basées sur des images**. Elle utilise un certain nombre de fonctionnalités du noyau
Linux dont notamment les **cgroups** et les **espaces de noms**.

Ce projet s'intéresse à **l'orchestration** (c'est à dire au déploiement à l'organisation et à
l'exécution) de ses conteneurs pour la **production de services applicatifs**. Le composant
d'orchestration utilisé dans ce projet s'appelle **Kubernetes**.

Un certain nombre de composants ont été nécessaires à la mise en œuvre de ce projet dont voici une
liste non exhaustive :

- *Arch Linux* : Système hôte + *bastion*
- *Systemd-nspawn* : Conteneurisation légère hôte
- *Rocky8 minimal* : *Infra* + *cnode* + *wnode*
- *Systemd-networkd* : Réseautage Arch Linux
- *NetworkManager* : Réseautage Rocky
- *Systemd-homed* : Gestion du home utilisateur *bastion*
- *Wireguard* : Accès sécurisé VPN pair à pair *infra*/*bastion* (module noyau)
- *Shorewall* : Pare-feux *infra*
- *Podman* : Gestion de la conteneurisation
- *Buildah et skopeo* : Gestion des images de conteneurs
- *Kubernetes* : Orchestration des conteneurs
- *CRI-O* : Environnement d'exécution des conteneurs (composant middleware)
- *Crun* : Runtime légère création et exécution de conteneurs
- *UBI* : Image de base universelle redhat (microdnf et SELinux)
