# Architecture du projet

## Introduction

L'architecture principale du projet comprend **4 machines** :
* Un **bastion** comprenant :
    + Un accés au WAN de la zone agent
    + Un accés VPN pair à pair avec la machine d'infra
    + Un pare-feux
    + Un client SSH
* Une machine d'**infra**structure comprenant :
    + Un accés VPN pair à pair avec des postes bastions via le WAN agent
    + Un accés au réseau d'administration de la grappe *Kubernetes*
    + Un pare-feux
* Un **cnode** comprenant :
    + Un serveur SSH
    + Un plan de contrôle Kubernetes
* Un **wnode** comprenant :
    + Un serveur SSH
    + Un noeud Kubernetes
    + Podman
    + Crun
    + CRI-O

Un **commutateur réseau virtuel Open vSwitch** et **3 réseaux** :

* **wana** : le WAN agent
* **admin** : l'administration de la grappe
* **data** : la communication entre plan de contrôle et noeuds
