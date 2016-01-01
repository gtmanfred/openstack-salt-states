disable postfix:
  service.dead:
    - name: postfix
    - disable: True

  pkg.removed:
    - name: postfix
