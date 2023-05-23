# Architecture

## Réseautage

### Systemd-nspawn

<table style="text-align:center">
    <thead>
        <tr><th>Machine</th><th>Interface conteneur (⇔ hôte)</th><th>Type</th><th>Adressage</th></tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2>Bastion</td>
            <td style="color:#04060a;background-color:#d43f3f">wana0 ⇔ ve-basti_wana0</td>
            <td style="color:#04060a;background-color:#d43f3f">veth</td>
            <td style="color:#04060a;background-color:#d43f3f">10.0.0.2 ⇔ 12/8</td>
        </tr>
        <tr>
            <td>wg0</td>
            <td>wireguard</td>
            <td>172.30.18.101/24</td>
        </tr>
        <tr>
            <td rowspan=3>Infra</td>
            <td style="color:#04060a;background-color:#b3bf3b">admin0 ⇔ ve-infra_admin0</td>
            <td style="color:#04060a;background-color:#b3bf3b">veth</td>
            <td style="color:#04060a;background-color:#b3bf3b">172.16.18.11 ⇔ 21/24</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#d43f3f">wana0 ⇔ ve-infra_wana0</td>
            <td style="color:#04060a;background-color:#d43f3f">veth</td>
            <td style="color:#04060a;background-color:#d43f3f">10.0.0.1 ⇔ 11/8</td>
        </tr>
        <tr>
            <td>wg0</td>
            <td>wireguard</td>
            <td>172.30.18.1/24</td>
        </tr>
        <tr>
            <td rowspan=2>Cnode</td>
            <td style="color:#04060a;background-color:#b3bf3b">admin0 ⇔ ve-cnode_admin0</td>
            <td style="color:#04060a;background-color:#b3bf3b">veth</td>
            <td style="color:#04060a;background-color:#b3bf3b">172.16.18.12 ⇔ 22/24</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#69a1cf">data0 ⇔ ve-cnode_data0</td>
            <td style="color:#04060a;background-color:#69a1cf">veth</td>
            <td style="color:#04060a;background-color:#69a1cf">172.20.18.12 ⇔ 22/24</td>
        </tr>
        <tr>
            <td rowspan=2>Wnode</td>
            <td style="color:#04060a;background-color:#b3bf3b">admin0 ⇔ ve-wnode_admin0</td>
            <td style="color:#04060a;background-color:#b3bf3b">veth</td>
            <td style="color:#04060a;background-color:#b3bf3b">172.16.18.13 ⇔ 23/24</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#69a1cf">data0 ⇔ ve-wnode_data0</td>
            <td style="color:#04060a;background-color:#69a1cf">veth</td>
            <td style="color:#04060a;background-color:#69a1cf">172.20.18.13 ⇔ 23/24</td>
        </tr>
    </tbody>
</table>

### Open vSwitch

<table style="text-align:center">
    <thead>
        <tr><th>Pont</th><th>Interface</th><th>Machine</th></tr>
    </thead>
    <tbody>
        <tr>
            <td style="color:#04060a;background-color:#d43f3f" rowspan=2>br-wana</td>
            <td style="color:#04060a;background-color:#d43f3f">ve-basti_wana0</td>
            <td>Bastion</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#d43f3f">ve-infra_wana0</td>
            <td rowspan=2>Infra</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#b3bf3b" rowspan=3>br-admin</td>
            <td style="color:#04060a;background-color:#b3bf3b">ve-infra_admin0</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#b3bf3b">ve-cnode_admin0</td>
            <td rowspan=4>Cnode et Wnode</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#b3bf3b">ve-wnode_admin0</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#69a1cf" rowspan=2>br-data</td>
            <td style="color:#04060a;background-color:#69a1cf">ve-cnode_data0</td>
        </tr>
        <tr>
            <td style="color:#04060a;background-color:#69a1cf">ve-wnode_data0</td>
        </tr>
    </tbody>
</table>
