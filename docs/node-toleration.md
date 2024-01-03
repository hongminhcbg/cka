> k taint node minikube key=val:NoSchedule 
node/minikube tainted

$ k taint node NODENAME KEY=VAL:NoEFFEECT

No pods will be able to schedule onto NODENAME unless match taint lolerations
$ k get node minikube -oyaml #will get input

effects:
    NoExecute: all already running pods will be evitced immediately
...
spec:
  podCIDR: 10.244.0.0/24
  podCIDRs:
  - 10.244.0.0/24
  taints:
  - effect: NoSchedule
    key: key
    value: val
...