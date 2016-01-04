sshkeys:
  ssh_auth.present:
    - user: root
    - names: {{pillar['keys']['public_keys']}}
