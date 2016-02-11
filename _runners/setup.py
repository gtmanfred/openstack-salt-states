"""
Run salt \* network.interfaces --out yaml | python ipsetup.py
"""
import logging
import pprint
from salt.config import master_config
from salt.runner import RunnerClient
import yaml

log = logging.getLogger(__name__)


def ips(*args, **kwargs):
    '''
    Runner for setting up ips for openstack
    '''
    runner = RunnerClient(master_config('/etc/salt/master'))
    ifs = runner.cmd(fun='mine.get', kwarg={'tgt': '*', 'fun': 'network.interfaces'})
    log.debug('Interfaces to setup:\n%s', pprint.pformat(ifs))
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
    log.debug('IPs to setup:\n%s', pprint.pformat(ifs))

    with open('/srv/pillar/ips.sls', 'w') as ipfile:
        log.debug('Writing ips to file /srv/pillar/ips.sls')
        yaml.dump(ips, ipfile, default_flow_style=False)

    return ips
