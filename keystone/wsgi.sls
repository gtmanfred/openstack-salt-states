servername file:
  file.managed:
    - name: /etc/httpd/conf.d/20-servername.conf
    - contents: |
        ServerName controller

wsgi file:
  file.managed:
    - name: /etc/httpd/conf.d/30-wsgi-keystone.conf
    - source: salt://keystone/files/wsgi.conf

start apache:
  service.running:
    - name: httpd
    - enable: True
    - listen:
      - file: wsgi file
      - file: servername file
