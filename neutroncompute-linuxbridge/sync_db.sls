{%- if grains.get('neutron', {}).get('sync_db', False) == False %}
init neutrondb:
  cmd.run:
    - name: /usr/bin/neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head
    - user: neutron

  grains.present:
    - name: neutron
    - value:
        sync_db: True
{%- endif %}
