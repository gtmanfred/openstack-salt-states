cinder pv:
  lvm.pv_present:
    - name: /dev/xvde1

cinder vg:
  lvm.vg_present:
    - name: cinder-volumes
    - devices: /dev/xvde1
