# Bastion

## Configuration

### Réseau

L'hôte et le conteneur étant tout les deux des systèmes ArchLinux utilisant systemd-networkd, la
configuration réseau se fera à l'aide de fichiers *.network* sur l'hôte.

Afin de configurer le côté invité du lien ethernet virtuel WAN agent, on créé le fichier
*70-bastion-wana0.network* :
```ini,ignore
[Match]
Name=ve-basti_wana0*
Driver=veth

[Network]
Address=10.0.0.12/8
LLDP=yes
EmitLLDP=customer-bridge
```

Et afin de configurer le côté hôte du lien WAN, on créé le fichier *70-bastion-ve_wana0.network* :
```ini,ignore
[Match]
Host=bastion
Virtualization=container
Name=wana0

[Network]
Address=10.0.0.2/8
LLDP=yes
EmitLLDP=customer-bridge
```

### Nspawn

Enfin et afin de rajouter le lien ethernet virtuel pour le WAN agent, on créé le fichier
*/etc/systemd/nspawn/bastion.nspawn* suivant:
```ini,ignore
[Network]
Private=yes
VirtualEthernet=yes
VirtualEthernetExtra=ve-basti_wana0:wana0
```
