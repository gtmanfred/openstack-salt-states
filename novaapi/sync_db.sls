{%- if grains.get('nova', {}).get('sync_db', False) == False %}
init nova db:
  cmd.run:
    - name: /usr/bin/nova-manage db sync
    - user: nova

  grains.present:
    - name: nova
    - value:
        sync_db: True
{%- endif %}
