{% from "rabbitmq/map.jinja" import rabbitmq with context %}
rabbitmq remove guest:
  rabbitmq_user.absent:
    - name: guest

{%- if rabbitmq.users is defined %}
{%- for user in rabbitmq.users.values() %}
rabbitmq create {{user['username']}}:
  rabbitmq_user.present:
    - name: {{user['username']}}
    - password: {{user['password']}}
    - perms:
      - '/':
        - '.*'
        - '.*'
        - '.*'
{%- endfor %}
{%- endif %}
