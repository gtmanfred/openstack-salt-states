{%- set publicip = salt['config.get']('ips:keystone:public') %}
{%- set privateip = salt['config.get']('ips:keystone:private') %}
keystone.token: 99bfa3ca9193f2e671c1
keystone.endpoint: http://{{privateip}}:35357/v2.0/
