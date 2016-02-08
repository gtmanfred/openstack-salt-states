"""
Run salt \* network.interfaces --out yaml | python ipsetup.py
"""
import sys
import yaml

ifs = yaml.load(sys.stdin)
ips = {
    'ips': {
        'glance': {
            'public': ifs.get('glance.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('glance.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
        'keystone': {
            'public': ifs.get('keystone.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('keystone.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
        'novaapi': {
            'public': ifs.get('novaapi.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('novaapi.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
        'neutronapi': {
            'public': ifs.get('neutronapi.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('neutronapi.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
        'mistral': {
            'public': ifs.get('mistral.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('mistral.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
        'cinder': {
            'public': ifs.get('cinderapi.manfred.io', {}).get('eth0', {}).get('inet', [{}])[0].get('address', 'localhost'),
            'private': ifs.get('cinderapi.manfred.io', {}).get('eth1', {}).get('inet', [{}])[0].get('address', 'localhost'),
        },
    }
}

with open('/srv/pillar/ips.sls', 'w') as ipfile:
    yaml.dump(ips, ipfile, default_flow_style=False)
