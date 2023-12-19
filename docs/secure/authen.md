I. authentication

kube-apiserver
    - apiserver.ctr
    - apiserver.key

Generate CA

    $ openssl genrsa -out ca.key 2048
    $ openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr
    $ openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt