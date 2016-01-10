include:
  - .packages
  - .config

dashboard services:
  service.running:
    - name: httpd
    - enable: True
    - listen:
      - file: horizon config files
