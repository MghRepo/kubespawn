# Bastion

## Systemd-homed

### Stockage LUKS

Le mécanisme de chiffrement du home *LUKS* n'est pas supporté dans *systemd-nspawn*.
```bash,ignore
$ homectl create hugo --storage=luks
```

Avec cette option *systemd-homed* créé un fichier auxquel il attache une interface de périphérique
de bloc à l'aide du périphérique de boucle */dev/loop-control*, puis chiffre le périphérique obtenu
avec *LUKS* (back-end *dm-crypt*).

Or les périphériques de blocs (et spécifiquement les périphériques de boucle) ne sont pas proprement
virtualisés dans Linux. Les périphériques de boucle existent sur un espace de nom logique unique et
ont un comportement qui peut être qualifié de dynamique.

En effet */dev/loop-control* permet à une application de trouver dynamiquement un périphérique libre
et d'ajouter/supprimer des périphériques de boucle au système.

> **Remarque** : On peut lier un périphérique de boucle spécifique dans le conteneur via l'option
  bind, par exemple : *[File] Bind=/dev/loop4*, mais le conteneur ne pourra jamais allouer de
  nouveaux périphériques de blocs et le conteneur n'est pas exactement le "propriétaire" du
  périphérique. De plus du fait que *sysfs* n'est pas virtualisé dans systemd-nspawn, les
  applications du conteneur ne peuvent pas découvrir le périphérique automatiquement.
