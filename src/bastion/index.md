# Bastion

## Introduction

Le poste *bastion* est un poste agent, situé en **zone agent (ZA)** avec un accès au WAN agent.
Afin d'assurer la sécurité du poste il doit comprendre à minima les élément suivant :
* Accés VPN sécurisé
* Pare-feux
* Chiffrement

Cette machine utilise la distribution **ArchLinux** qui en plus de m'être familiaire a de nombreux
avantages desquels on peut citer :

* Rolling release
* Communautaire
* Basée systemd (systemd-homed inclus)
* Excellente documentation
