{%- for value in pillar.postgres.users.itervalues() %}
create user {{value['username']}}:
  postgres_user.present:
    - name: {{value['username']}}
    - superuser: {{value.get('superuser', False)}}
    - password: {{value['password']}}
    - db_user: postgres
  postgres_database.present:
    - name: {{value['db']}}
    - owner: {{value['username']}}
{%- endfor %}
