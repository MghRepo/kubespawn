# Machine d'infrastructure

## Configuration nspawn

Enfin et afin de rajouter le lien ethernet virtuel pour le réseau admin et WAN agent, on créé le
fichier */etc/systemd/nspawn/infra.nspawn* suivant:
```ini,ignore
[Network]
Private=yes
VirtualEthernet=yes
VirtualEthernetExtra=ve-infra_admin0:admin0
VirtualEthernetExtra=ve-infra_wana0:wana0
```
