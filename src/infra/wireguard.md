# Machine d'infrastructure

## Wireguard

Installer les outils wireguard de l'espace utilisateur :
```bash,ignore
$ sudo dnf install wireguard-tools
```

Générer une paire de clefs (publique/privée) :
```bash,ignore
$ wg genkey | (umask 0077 && tee bastion.key) | wg pubkey > bastion.pub
```

Créer une interface de type wireguard :
```bash,ignore
$ ip link add wg0 type wireguard
```

Récupérer et copier la clef publique de *bastion* (optionnellement également, la clef *preshared*).
Configurer le fichier **/etc/wireguard/wg0.conf** avec respectivement les clefs *infra.key* et
*bastion.pub* :
```ini,ignore
[Interface]
PrivateKey = eHGRDsCibdQw+htxJYnLy2bcJIt7ATXFnlqrD7oqzEs=
Address = 172.30.18.1/24
ListenPort = 41740

PostUp = sysctl -w net.ipv4.ip_forward=1
PreDown = sysctl -w net.ipv4.ip_forward=0

[Peer]
PublicKey = uq75eVp7ezfchZBgYPbp3267vzVOUf4IWBqZzV/kqhA=
AllowedIPs = 172.30.18.101/32
```

> **Remarque** : On lie le forwarding ip à l'activation et à la désactivation de l'interface wireguard
  car il s'agit d'un accés VPN point à site *passerelle*. D'autres options de routages peuvent être
  envisagées en fonction des besoins : *masquerading (SNAT)* ou *port forwarding*.

Activer et démarrer le service **wg-quick@wg0** qui instancie l'accés :
```bash,ignore
$ sudo systemctl enable --now wg-quick@wg0.service
```
