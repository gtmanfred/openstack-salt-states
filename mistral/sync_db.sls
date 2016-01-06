{%- if grains.get('mistral', {}).get('sync_db', False) == False %}
init mistral db:
  cmd.run:
    - names:
      - mistral-db-manage --config-file /etc/mistral.conf upgrade head
      - mistral-db-manage --config-file /etc/mistral.conf populate
    - user: mistral

  grains.present:
    - name: mistral
    - value:
        sync_db: True
{%- endif %}
