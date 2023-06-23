# Systemd-nspawn

## Configuration

Pour spécifier un paramétrage par conteneur et pas des surcharges globales, le fichier
**/etc/systemd/nspawn/nomConteneur.nspawn** peut être utilisé.

Plusieurs sections y sont définies contenant un ensemble de couple clefs-valeurs par exemple :
```ini,ignore
[Exec]
SystemCallFilter=add_key keyctl bpf
[File]
Bind=/dev/fuse
[Network]
Private=no
```

> **Remarque** : La configuration ci-dessus expose les appels système *add_key*, *keyctl* et *bpf*
  au conteneur qui ne sont pas contenu dans des espaces de noms. Cela peut représenter un risque de
  sécurité, même si bien moindre que de désactiver entièrement les espaces de noms utilisateurs
  comme ce qui se faisait avant les cgroups v2.
