# Systemd-nspawn

## Configuration

### Contrôle de ressource

On peut utiliser les cgroups afin d'implémenter des limites et des gestions de ressources pour les
conteneurs avec *systemctl set-property*. Par exemple :

```bash,ignore
$ sudo systemctl set-property systemd-nspawn@nomConteneur DeviceAllow='/dev/fuse rwm'
$ sudo systemctl set-property systemd-nspawn@nomConteneur MemoryHigh=2G
$ sudo systemctl set-property systemd-nspawn@nomConteneur CPUQuota=100%
```

Cela créera des fichiers permanents dans
*/etc/systemd/system.control/systemd-nspawn@container-name.service.d/*.

> Remarque : *MemoryMax* impose une limite stricte à l'instar de *MemoryHigh* qui est à privilégier.
