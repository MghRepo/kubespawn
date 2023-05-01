# Machine d'infrastructure

## Configuration

### Réseau

Afin de configurer le côté hôte du lien WAN, on créé le fichier *70-infra-ve_wana0.network* :
```ini,ignore
[Match]
Name=ve-infra_wana0*
Driver=veth

[Network]
Address=10.0.0.11/8
LLDP=yes
EmitLLDP=customer-bridge
```

Afin de configurer le côté hôte du lien admin, on créé le fichier *70-infra-ve_admin0.network* :
```ini,ignore
[Match]
Name=ve-infra_admin0*
Driver=veth

[Network]
Address=172.16.18.21/24
LLDP=yes
EmitLLDP=customer-bridge
```

et afin de configurer le côté invité des liens WAN et admin, on utilise les outils *nmcli* ou
*nmtui* :

| Interface |       IP        |
|-----------|-----------------|
|  admin0   | 172.16.18.11/24 |
|  wana0    |     10.0.0.1/8  |

### Nspawn

Enfin et afin de rajouter le lien ethernet virtuel pour les réseaux admin et WAN agent, on créé le
fichier */etc/systemd/nspawn/infra.nspawn* suivant:
```ini,ignore
[Network]
Private=yes
VirtualEthernet=yes
VirtualEthernetExtra=ve-infra_admin0:admin0
VirtualEthernetExtra=ve-infra_wana0:wana0
```
