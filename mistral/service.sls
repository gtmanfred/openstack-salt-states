include:
  - .config
  - .packages

start mistral:
  file.managed:
    - names:
      - /etc/systemd/system/mistral-api.service:
        - source: salt://mistral/files/mistral-api.service
      - /etc/systemd/system/mistral-engine.service:
        - source: salt://mistral/files/mistral-engine.service
      - /etc/systemd/system/mistral-executor.service:
        - source: salt://mistral/files/mistral-executor.service

  service.running:
    - names: 
      - mistral-api.service:
        - listen:
          - file: mistral config file
          - git: mistral install
      - mistral-engine.service:
        - listen:
          - file: mistral config file
          - git: mistral install
      - mistral-executor.service:
        - listen:
          - file: mistral config file
          - git: mistral install
    - enable: True
