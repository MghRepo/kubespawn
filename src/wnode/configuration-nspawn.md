# Wnode

## Configuration nspawn

Enfin et afin de rajouter le lien ethernet virtuel pour le réseau admin et data, on créé le
fichier */etc/systemd/nspawn/wnode.nspawn* suivant:
```ini,ignore
[Network]
Private=yes
VirtualEthernet=yes
VirtualEthernetExtra=ve-wnode_admin0:admin0
VirtualEthernetExtra=ve-wnode_data0:data0
```
