rabbitmq remove guest:
  rabbitmq_user.absent:
    - name: guest

{%- if pillar.rabbitmq.users is defined %}
{%- for user in pillar.rabbitmq.users.values() %}
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
