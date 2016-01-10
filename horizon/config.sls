horizon config files:
  file.managed:
    - name: /etc/openstack-dashboard/local_settings
    - makedirs: True
    - contents: |
        DEBUG = False
        TEMPLATE_DEBUG = DEBUG
        WEBROOT = '/dashboard/'
        ALLOWED_HOSTS = ['*', ]
        CACHES = {
            'default': {
                'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
                'LOCATION': 'memcached.manfred.io:11211',
            }
        }
        OPENSTACK_HOST = "controller"
        OPENSTACK_KEYSTONE_URL = "http://keystone.manfred.io:5000/v2.0"
        OPENSTACK_KEYSTONE_DEFAULT_ROLE = "user"
        TIME_ZONE = "America/Chicago"
        SECRET_KEY = "{{ salt['grains.get_or_set_hash']('horizon:secret_key') }}"
