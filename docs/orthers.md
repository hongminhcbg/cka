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


