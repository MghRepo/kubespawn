# Bastion

## Wireguard

Installer les outils wireguard de l'espace utilisateur :
```bash,ignore
$ sudo pacman -S wireguard-tools
```

Générer une paire de clefs (publique/privée) :
```bash,ignore
$ wg genkey | (umask 0077 && tee bastion.key) | wg pubkey > bastion.pub
```

Créer une interface de type wireguard :
```bash,ignore
$ sudo ip link add wg0 type wireguard
```

Récupérer et copier la clef publique de *infra* (optionnellement également, la clef *preshared*).
Configurer le fichier **/etc/wireguard/wg0.conf** avec respectivement les clefs *bastion.key* et
*infra.pub* :
```ini,ignore
[Interface]
Address = 172.30.18.101/24
PrivateKey = wHHx5bOO+jxGi2h3lCN/QiXl+FIZ964ZY4R501EpMmg=
ListenPort = 41741

[Peer]
PublicKey = gxt5G/tUgSh1W8xOUX8TvWNCHvxsEvDUEAr8hu71fTA=
Endpoint = 10.0.0.1:41740
AllowedIPs = 172.30.18.1/32, 172.16.18.0/24
```

Activer et démarrer le service **wg-quick@wg0** qui instancie l'accés :
```bash,ignore
$ sudo systemctl enable --now wg-quick@wg0.service
```
