# Cnode

## Introduction

Le cnode est le noeud de la grappe *Kubernetes* qui porte le plan de contrôle. Il comprend à minima
les éléments suivants :

* Kube-apiserver
* Etcd
* Kube-scheduler
* Kube-controller-manager

Renseigner le nom d'hôte :

```bash,ignore
$ sudo machinectl login cnode
$ sudo hostnamectl set-hostname cnode
```

Côté hôte, limiter l'utilisation des ressources du conteneur :
```bash,ignore
$ sudo systemctl set-property systemd-nspawn@cnode MemoryHigh=4G
$ sudo systemctl set-property systemd-nspawn@cnode CPUQuota=200%
```
