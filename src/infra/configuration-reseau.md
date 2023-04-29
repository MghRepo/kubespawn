# Machine d'infrastructure

## Configuration réseau

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
