# Podman

Podman est un outil libre, natif linux, daemonless qui permet d'exécuter de construire et de
partager des applications utilisant des conteneurs et des images de conteneurs OCI. Podman fournit
un interface en ligne de commande similaire à celle du Docker Container Engine.

Similaire également, à d'autres moteurs de conteneur (Docker, CRI-O, containerd), Podman s'appuie
sur un environnement d'exécution **compatible OCI** afin de s'interfacer avec le système
d'exploitation pour créer des conteneurs.

Les conteneurs podman peuvent soit être exécuté par **root** soit par des utilisateurs
**non-privilégiés**. Podman gère l'écosystème de conteneurisation (pods, conteneurs, images,
volumes) à l'aide de la bibliothèque **libpod**.

Il existe une API RESTFul pour gérer les conteneurs.
