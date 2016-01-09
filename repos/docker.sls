docker repo:
  pkgrepo.managed:
    - name: dockerrepo
    - humanname: Docker Repository
    - gpgcheck: 1
    - baseurl: https://yum.dockerproject.org/repo/main/centos/$releasever/
    - gpgkey: https://yum.dockerproject.org/gpg
