VolumeMode

    - Filesystem default mode, mount pod to a dir
    - Block raw block, including dynamic provisioning

Storage Class

    - static provisioning: create manual disk on google cloud, aws and map name to pv
    - define a storage class, auto create a pv and block

pvc.spec.storageClassName == manual
k8s manual bound pv

storageClassName != manual: dynamic provision

pv.storageClassName must be equal pvc.storageClassName