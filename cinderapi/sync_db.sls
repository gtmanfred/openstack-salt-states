{%- if grains.get('sync_db', False) == False %}
init cinder db:
  cmd.run:
    - name: cinder-manage db sync
    - user: cinder

  grains.present:
    - name: sync_db
    - value: True
{%- endif %}
