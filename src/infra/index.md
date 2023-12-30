# Machine d'infrastructure

## Introduction

Afin de gérer les accés administrateurs à la grappe *Kubernetes*, il est nécessaire d'instancier une
machine d'infrastructure comprenant à minima les éléments suivants :

* Accés VPN sécurisé
* Pare-feux

Renseigner le nom d'hôte :
```bash,ignore
$ sudo machinectl login infra
$ sudo hostnamectl set-hostname infra
```

Côté hôte, limiter l'utilisation des ressources du conteneur :
```bash,ignore
$ sudo systemctl set-property systemd-nspawn@infra MemoryHigh=2G
$ sudo systemctl set-property systemd-nspawn@infra CPUQuota=100%
```
