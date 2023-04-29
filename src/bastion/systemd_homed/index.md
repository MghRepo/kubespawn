## Systemd-homed

Systemd-homed est un service systemd qui fournit des comptes utilisateurs portables indépendants de
la configuration système.

Il met en oeuvre cette portabilité en déplaçant toutes les informations liées à l'utilisateur dans
un emplacement de stockage, optionnellement chiffré, en créant un fichier *~/.identity* qui contient
des informations signées à propos :
* de l'utilisateur,
* du mot de passe,
* des groupes auxquels il appartient,
* UID/GID
et autres informations qui seraient généralement éclatées à travers de multiples fichiers dans */*.

Cette approche ne permet pas simplement la portabilité du répertoire home, mais également fournit
une sécurité en gérant le chiffrement du home à la connexion et vérouillant le système s'il est
suspendu.

Afin de pouvoir utiliser *systemd-homed* :
```bash,ignore
$ sudo machinectl shell bastion
$ systemctl enable --now systemd-homed
```
