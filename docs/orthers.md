Imperative vs Declarative 

Imperative
    
    k create ...
    k delete ...
    k replace ... || k replace --force ...

Declarative
    # only one 
    k apply -f ...

Tait and tolerations
k label nodes <node-name> <key>=<val>

Node affinity
    - key
    - operator [In, notIn, exists]
    - values

Limit and request

    - kube-scheduler schedule the best node to place the pods on
    - when pod try to exceed the limit => OOM

limit and request default behavior
    
   - no limit, no request => as many as CPU available 
   - no request, limit => request = limit
   - request, no limit => as many as CPU available

Deamon Set 

    the copy of pod always appear in new node
    for logging and monitoring

![x](./imgs/deamonset.jpeg?raw=true)

Static pod
    
    (only pod) store in /etc/kubenetes/manifests
    no kube-scheduler
    no kube-api 
    kubelet read the dir interval and create
    read only with kubectl command


![x](./imgs/static_pod.jpeg?raw=true)


realcmd = entrypoint + command
command can be overwrited
example 
    
    // dockerfile 
    ENTRYPOINT ["sleep"]
    CMD ["10"] // => sleep 10 when startup
    // if u run 'docker run ubuntu 50' the real command is sleep 50 on startup 

Troubleshooting

I. Worker node fail

    $ k get nodes
    $ sudo journalctl -u kubelet -f # get log kubelet

Importrant:

    - backup etcd
    - volume
    - create pv, pvc
    - create user with per, SA, role, role  blinding
    - dns lookup
    - node tolerations


$ k config get-contexts --no-headers=true -o=name
$ k config current-context
$ cat ~/.kube/config | grep current | awk '{print $2}' # get current context without kubeclt

Pod.spec.nodeName: 'xxx' # skip schedulers, orverwrite NodeAffinity

$ k scale --replicas=2 deployment web #scale deployment
---
sh -c can run with list command ...
      exec:
        command:
        - sh
        - -c
        - 'wget -T2 -O- http://service-am-i-ready:80'
---
kubelet: [TYPE] => process, $ sudo systemctl status kubelet
kube-apiserer: [TYPE] => static pods, in /etc/kubenetes/manifests
kube-cheduler: [TYPE] => static pods, in /etc/kubenetes/manifests
kube-controller-manager: [TYPE] => static pods, in /etc/kubenetes/manifests
ectd: [TYPE] => static pod => ...-master1, in /etc/kubenetes/manifests
dns: [TYPE] [NAME] => pod, pod name coredns => $ k get all -n kube-system | grep dns

TYPE in list [not-installed, precess, static-pod, pod]
---
stop scheduler => edit wrong config in /etc/kubenetes/manifests/kube-cheduler.yaml, make sure it crash
Or move to another dir

Pod.spec.nodeName is not null => manual scheduler
--- 
run ds on master node

apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-elasticsearch
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: fluentd-elasticsearch
  template:
    metadata:
      labels:
        name: fluentd-elasticsearch
    spec:
      tolerations: 
      # these tolerations are to have the daemonset runnable on control plane nodes
      # remove them if your control plane nodes should not run pods
      - key: node-role.kubernetes.io/control-plane
        operator: Exists
        effect: NoSchedule
      - key: node-role.kubernetes.io/master
        operator: Exists
        effect: NoSchedule
      containers: