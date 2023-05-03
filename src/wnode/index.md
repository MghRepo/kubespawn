# Wnode

## Introduction

Le wnode est le noeud de la grappe *Kubernetes* qui execute les pods. Il comprend à minima les
éléments suivants :

* Podman
* Crun
* Kubelet
* Kube-proxy
* CRI-O

Renseigner le nom d'hôte :

```bash,ignore
$ sudo machinectl login wnode
$ sudo hostnamectl set-hostname wnode
```

Côté hôte, limiter l'utilisation des ressources du conteneur :
```bash,ignore
$ sudo systemctl set-property systemd-nspawn@wnode MemoryHigh=2G
$ sudo systemctl set-property systemd-nspawn@wnode CPUQuota=100%
```
