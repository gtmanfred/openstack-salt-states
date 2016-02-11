"""
Run salt \* network.interfaces --out yaml | python ipsetup.py
"""
import logging
import pprint
import salt.config
import salt.runner

log = logging.getLogger(__name__)


def ext_pillar(minion_id, pillar, **kwargs):
    '''
    Runner for setting up ips for openstack
    '''
    opts = salt.config.master_config('/etc/salt/master')
    opts['quiet'] = True
    runner = salt.runner.RunnerClient(opts)
    ifs = runner.cmd('mine.get', kwarg={'tgt': '*', 'fun': 'network.interfaces'})
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

    return ips
