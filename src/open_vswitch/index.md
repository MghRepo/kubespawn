# Open vSwitch

## Introduction

Open vSwitch est un switch logiciel multicouche. Il est construit de manière à permettre une
automatisation massive des opérations réseaux à l'aide d'extensions.

Afin d'installer et d'activer au démarrage le switch virtuel :

```bash,ignore
$ sudo pacman -S openvswitch
$ sudo systemctl enable --now openvswitch
```

> Remarque : Open vSwitch fonctionne à l'aide de 2 services **ovs-vswitchd** pour le daemon et
  **ovsdb-server** pour le serveur de base de donnée du switch.
