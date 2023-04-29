## Configuration

### Réseau

Afin de configurer le côté hôte du lien admin, on créé le fichier *70-cnode-ve_admin0.network* :
```ini,ignore
[Match]
Name=ve-cnode_admin0*
Driver=veth

[Network]
Address=172.16.18.22/24
LLDP=yes
EmitLLDP=customer-bridge
```

Afin de configurer le côté hôte du lien admin, on créé le fichier *70-cnode-ve_data0.network* :
```ini,ignore
[Match]
Name=ve-cnode_data0*
Driver=veth

[Network]
Address=172.16.20.22/24
LLDP=yes
EmitLLDP=customer-bridge
```

et afin de configurer le côté invité des liens admin et data, on utilise les outils *nmcli* ou
*nmtui* :

| Interface |       IP        |
|-----------|-----------------|
|  admin0   | 172.16.18.12/24 |
|   data0   | 172.16.20.12/24 |

et ajouter la route vers l'accés VPN infra :

|  Destination   |     Saut     |
|----------------|--------------|
| 172.30.18.0/24 | 172.16.18.11 |

### Nspawn

Enfin et afin de rajouter le lien ethernet virtuel pour les réseaux admin et data, on créé le
fichier */etc/systemd/nspawn/cnode.nspawn* suivant:
```ini,ignore
[Network]
Private=yes
VirtualEthernet=yes
VirtualEthernetExtra=ve-cnode_admin0:admin0
VirtualEthernetExtra=ve-cnode_data0:data0
```
