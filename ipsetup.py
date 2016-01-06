"""
Run salt \* network.interfaces --out yaml | python ipsetup.py
"""
import sys
import yaml

ifs = yaml.load(sys.stdin)
ips = {
    'ips': {
        'glance': {
            'public': ifs['glance.manfred.io']['eth0']['inet'][0]['address'],
            'private': ifs['glance.manfred.io']['eth1']['inet'][0]['address'],
        },
        'keystone': {
            'public': ifs['keystone.manfred.io']['eth0']['inet'][0]['address'],
            'private': ifs['keystone.manfred.io']['eth1']['inet'][0]['address'],
        },
        'novaapi': {
            'public': ifs['novaapi.manfred.io']['eth0']['inet'][0]['address'],
            'private': ifs['novaapi.manfred.io']['eth1']['inet'][0]['address'],
        },
        'neutronapi': {
            'public': ifs['neutronapi.manfred.io']['eth0']['inet'][0]['address'],
            'private': ifs['neutronapi.manfred.io']['eth1']['inet'][0]['address'],
        },
        'mistral': {
            'public': ifs['mistral.manfred.io']['eth0']['inet'][0]['address'],
            'private': ifs['mistral.manfred.io']['eth1']['inet'][0]['address'],
        },
    }
}

with open('/srv/pillar/ips.sls', 'w') as ipfile:
    yaml.dump(ips, ipfile, default_flow_style=False)
