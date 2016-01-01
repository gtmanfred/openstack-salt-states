start rabbitmq:
  service.running:
    - name: rabbitmq-server
    - enable: True
