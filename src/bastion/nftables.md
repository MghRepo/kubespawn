# Bastion

## Nftables

Afin de sécuriser un minimum le poste Bastion on configurera *Netfilter* :
```bash,ignore
$ sudo pacman -S nftables
```

Placer [ce fichier](/.fichiers/nftables.conf) dans */etc/* et activer le service :
```bash,ignore
$ sudo systemctl enable --now nftables.service
```
