{%- if grains.get('glance', {}).get('sync_db', False) == False %}
init glance db:
  cmd.run:
    - name: /usr/bin/glance-manage db_sync
    - user: glance

  grains.present:
    - name: glance
    - value:
        sync_db: True
{%- endif %}
