Test connection


    ETCDCTL_API=3 sudo etcdctl --endpoints https://127.0.0.1:2379   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key   --cacert=/etc/kubernetes/pki/etcd/ca.crt   member list

Backup database

    ETCDCTL_API=3 sudo etcdctl --endpoints https://127.0.0.1:2379   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key   --cacert=/etc/kubernetes/pki/etcd/ca.crt snapshot save backup.db

Make something fail, after that restore etcd

    ETCDCTL_API=3 sudo etcdctl --endpoints https://127.0.0.1:2379   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key   --cacert=/etc/kubernetes/pki/etcd/ca.crt snapshot restore backup.db --data-dir=/var/lib-etcd-new


edit volume to mount etcd data to new dir

    vi /etc/kubenetes/etcd.yaml
