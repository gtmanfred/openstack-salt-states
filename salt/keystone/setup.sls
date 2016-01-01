{%- if pillar.keystone.services is defined %}
{%- for service in pillar.keystone.services %}
keystone service {{service['name']}}:
  keystone.service_present:
    - name: {{service['name']}}
    - description: {{service['description']}}
    - service_type: {{service['type']}}
{%- endfor %}
{%- endif %}

{%- if pillar.keystone.endpoints is defined %}
{%- for endpoint in pillar.keystone.endpoints %}
keystone endpoint {{endpoint['name']}}:
  keystone.endpoint_present:
    - name: {{endpoint['name']}}
    - region: {{endpoint['region']}}
    - publicurl: {{endpoint['publicurl']}}
    - internalurl: {{endpoint['internalurl']}}
    - adminurl: {{endpoint['adminurl']}}
{%- endfor %}
{%- endif %}

{%- if pillar.keystone.tenants is defined %}
{%- for tenant in pillar.keystone.tenants %}
keystone tenant {{tenant['name']}}:
  keystone.tenant_present:
    - name: {{tenant['name']}}
    - description: {{tenant['description']}}
    - enabled: {{tenant.get('enabled', True)}}
{%- endfor %}
{%- endif %}

{%- if pillar.keystone.roles is defined %}
{%- for role in pillar.keystone.roles %}
keystone role {{role}}:
  keystone.role_present:
    - name: {{role}}
{%- endfor %}
{%- endif %}

{%- if pillar.keystone.users is defined %}
{%- for user in pillar.keystone.users.values() %}
keystone user {{user['name']}}:
  keystone.user_present:
    - name: {{user['name']}}
    - password: {{user['password']}}
    - email: {{user.get('email', 'nobody@manfred.io')}}
    - roles: {{user['roles']}}
{%- endfor %}
{%- endif %}
