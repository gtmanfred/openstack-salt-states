include:
  - .config

postgres service:
  service.running:
    - name: postgresql-9.4
    - enable: True
    - listen:
      - augeas: postgresql config
      - augeas: pg_hba config
