{% from "keystone/map.jinja" import keystone with context %}
{%- if keystone.services is defined %}
{%- for service in keystone.services %}
keystone service {{service['name']}}:
  keystone.service_present:
    - name: {{service['name']}}
    - description: {{service['description']}}
    - service_type: {{service['type']}}
{%- endfor %}
{%- endif %}

{%- if keystone.endpoints is defined %}
{%- for endpoint in keystone.endpoints %}
keystone endpoint {{endpoint['name']}}:
  keystone.endpoint_present:
    - name: {{endpoint['name']}}
    - region: {{endpoint['region']}}
    - publicurl: {{endpoint['publicurl']}}
    - internalurl: {{endpoint['internalurl']}}
    - adminurl: {{endpoint['adminurl']}}
{%- endfor %}
{%- endif %}

{%- if keystone.tenants is defined %}
{%- for tenant in keystone.tenants %}
keystone tenant {{tenant['name']}}:
  keystone.tenant_present:
    - name: {{tenant['name']}}
    - description: {{tenant['description']}}
    - enabled: {{tenant.get('enabled', True)}}
{%- endfor %}
{%- endif %}

{%- if keystone.roles is defined %}
{%- for role in keystone.roles %}
keystone role {{role}}:
  keystone.role_present:
    - name: {{role}}
{%- endfor %}
{%- endif %}

{%- if keystone.users is defined %}
{%- for user in keystone.users.values() %}
keystone user {{user['name']}}:
  keystone.user_present:
    - name: {{user['name']}}
    - password: {{user['password']}}
    - email: {{user.get('email', 'nobody@manfred.io')}}
    - roles: {{user['roles']}}
{%- endfor %}
{%- endif %}
