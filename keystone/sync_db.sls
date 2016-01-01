{%- if grains.get('keystone', {}).get('sync_db', False) == False %}
init keystone db:
  cmd.run:
    - name: /usr/bin/keystone-manage db_sync
    - user: keystone

  grains.present:
    - name: keystone
    - value:
        sync_db: True
{%- endif %}
