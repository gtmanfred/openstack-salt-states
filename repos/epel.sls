epel repo:
  pkgrepo.managed:
    - name: epel
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch
    - gpgcheck: 1
    - baseurl: http://mirror.rackspace.com/epel/7/$basearch
    - gpgkey: http://mirror.rackspace.com/epel/RPM-GPG-KEY-EPEL-7
