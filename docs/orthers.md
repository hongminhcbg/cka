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

