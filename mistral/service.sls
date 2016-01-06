include:
  - .config
  - .packages

start mistral:
  file.managed:
    - name: /etc/systemd/system/mistral.service
    - source: salt://mistral/files/mistral.service

  service.running:
    - names: 
      - mistral.service:
        - listen:
          - files: mistral config file
          - git: mistral install
    - enable: True
