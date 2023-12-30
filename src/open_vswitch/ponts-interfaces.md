# Open vSwitch

## Création des ponts et connexion des interfaces

Créer les ponts *br-admin*, *br-data* et *br-wana* :

```bash,ignore
$ sudo ovs-vsctl add-br br-admin
$ sudo ovs-vsctl add-br br-data
$ sudo ovs-vsctl add-br br-wana
```

Connecter les interfaces au port *br-admin* :
```bash,ignore
$ sudo ovs-vsctl add-port br-admin ve-cnode_admin0
$ sudo ovs-vsctl add-port br-admin ve-wnode_admin0
$ sudo ovs-vsctl add-port br-admin ve-infra_admin0
```

Connecter les interfaces au port *br-data* :
```bash,ignore
$ sudo ovs-vsctl add-port br-admin ve-cnode_data0
$ sudo ovs-vsctl add-port br-admin ve-wnode_data0
```
Connecter les interfaces au port *br-wana* :
```bash,ignore
$ sudo ovs-vsctl add-port br-admin ve-basti_wana0
$ sudo ovs-vsctl add-port br-admin ve-infra_wana0
```
