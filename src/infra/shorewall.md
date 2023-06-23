# Machine d'infrastructure

## Shorewall

Shorewall est un outil de haut niveau pour configurer Netfilter.

Il utilise des entrées dans un ensemble de fichiers de configuration décrivant l'état du pare-feux.
Shorewall lit ses fichiers de configuration et configure Nefilter selon la description.

> **Remarque** : Shorewall n'utilise pas le mode compatible *ipchains* mais il utilise
  avantageusement les possibilités de pistage des états de connexion Netfilter.

Installer le pare-feux :
```bash,ignore
$ sudo dnf install shorewall
```

### Zones

Renseigner les zones *fw*, *ZA* et *ZS* dans le fichier */etc/shorewall/zones* :

| Zone |   Type   |
|------|----------|
|  fw  | firewall |
|  ZA  |   ipv4   |
|  ZS  |   ipv4   |

### Interfaces

Renseigner les interfaces *wana0* *wg0* et *admin0* dans le fichier */etc/shorewall/interfaces* :

| Zone | Interface |
|------|-----------|
|  ZA  |   wana0   |
|  ZS  |   wg0     |
|  ZS  |   admin0  |

### Politiques de sécurité

Renseigner les politiques de sécurité dans le fichier */etc/shorewall/policy* :

| Source | Destination | Politique | LogLevel |
|--------|-------------|-----------|----------|
|  $FW   |     ALL     |  ACCEPT   |          |
|  ZS    |     ZA      |  ACCEPT   |          |
|  ZA    |     ZS      |  DROP     |   info   |
|  ALL   |     ALL     |  ACCEPT   |   info   |

### Règles

Renseigner la règle suivante dans le fichier */etc/shorewall/rules* :

| Action | Source | Destination | Protocole | Dport |
|--------|--------|-------------|-----------|-------|
| ACCEPT |   ZA   |     ZS      |    udp    | 41740 |

### Démarrer et activer le pare-feux

```bash,ignore
$ sudo systemctl enable --now shorewall
```
