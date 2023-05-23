# Systemd-nspawn

## Configuration

### Réseautage

Les conteneurs *systemd-nspawn* peuvent utiliser soit le réseautage hôte soit un réseautage privé :

* Dans le **mode hôte**, le conteneur a un accès total au réseau de l'hôte. Cela signifie que le
  conteneur sera capable d'accéder à tous les services réseaux sur l'hôte et que les paquets venant
  du conteneur apparaîtront pour le réseau externe comme venant de l'hôte (même adresse IP).
* Dans le **mode privé**, le conteneur est déconnecté du réseau de l'hôte. Cela rend les interfaces
  réseau de l'hôte indisponibles pour le conteneur :
    + Une interface existante peut être assigné au conteneur
    + Une interface réseau virtuelle associée à une interface existante (interface VLAN) peut être
      créée et assignée au conteneur
    + Un lien Ethernet virtuel entre l'hôte est le conteneur peut être créé.
  Dans le dernier cas le conteneur est complètement isolé (du réseau externe ainsi que des autres
  conteneurs) et nécessite une configuration entre l'hôte et les conteneurs. Généralement cela
  implique des créer des ponts pour connecter les interfaces physique ou virtuelles ou paramétrer le
  NAT entre les multiples interfaces.

Le réseautage hôte est adapté aux *conteneurs d'application* qui n'exécutent pas de logiciel de
réseautage qui configure l'interface assignée.

Le réseautage privé est adapté aux *conteneur systèmes* qui doivent être isolés du système hôte. La
création de liens Ethernet virtuels est un outil flexible pour permettre la création de réseaux
virtuels privés complexes. C'est le mode par défaut pour les conteneurs démarrés via *machinectl* ou
*systemd-nspawn@.service*.

#### Utiliser un lien Ethernet virtuel

Si un lien virtuel Ethernet est créé entre l'hôte et le conteneur dans le mode réseautage privé :
* Le côté hôte du lien sera disponible comme une interface réseau *ve-nomConteneur*.
* Le côté conteneur du lien sera nommé *host0*

> **Remarque** : Les liens Ethernet virtuels sont des "devices". Ils peuvent agir comme des tunnels
  entre des espaces de noms réseau pour faire un pont entre deux points. Une paire interconnectée
  peut être créée avec la commande *ip link add nom-p1 type veth peer name nom-p2*.

Quand on démarre le conteneur, une adresse IP doit être assignée aux deux interfaces (sur l'hôte et
dans le conteneur). Si on utilise **systemd-networkd** cela est réalisé automatiquement, sur l'hôte
ainsi que dans le conteneur :

* le fichier */usr/lib/systemd/network/80-container-ve.network* sur l'hôte vérifie l'interface
  *ve-nomConteneur* et démarre un serveur DHCP, qui assigne les adresses IP sur l'interface de
  l'hôte.
* le fichier */usr/lib/systemd/network/80-container-host0.network* dans le conteneur vérifie
  l'interface *host0* et démarre un client DHCP, qui reçoit les adresses IP de l'hôte.

*80-container-ve.network* :
```ini,ignore
[Match]
Name=ve-*
Driver=veth

[Network]
# Default to using a /28 prefix, giving up to 13 addresses per container.
Address=0.0.0.0/28
LinkLocalAddressing=yes
DHCPServer=yes
IPMasquerade=both
LLDP=yes
EmitLLDP=customer-bridge
IPv6SendRA=yes
```

*80-container-host0.network* :
```ini,ignore
[Match]
Virtualization=container
Name=host0

[Network]
DHCP=yes
LinkLocalAddressing=yes
LLDP=yes
EmitLLDP=customer-bridge

[DHCP]
UseTimezone=yes
```

> **Remarque** : Lorsqu'on examine les interfaces avec *ip link*, les noms d'interfaces affichent un
  suffixe, tel que *ve-nomconteneur@if2* et *host0@if9*. Le *@ifN* ne complète pas en réalité le nom
  de l'interface, *ip link* ajoute cette information pour indiquer à quel slot est connecté le câble
  ethernet virtuel à l'autre bout.
