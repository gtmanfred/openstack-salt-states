openstack liberty repo:
  pkgrepo.managed:
    - name: openstack-liberty
    - humanname: OpenStack Liberty Repository
    - gpgcheck: 1
    - baseurl: http://mirror.centos.org/centos/7/cloud/$basearch/openstack-liberty/
    - gpgkey: https://raw.githubusercontent.com/redhat-openstack/rdo-release/master/RPM-GPG-KEY-CentOS-SIG-Cloud
