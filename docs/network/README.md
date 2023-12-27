1. cat /etc/hosts => local mapping ip, name, can use hostname with multi command ping, ssh, curl ...

2. every host has a config dns file /etc/resolv.conf

3. www.google.com 

    google: domain
    .com: 
    www: sub domain, can extend maps.google.com, drivers.google.com

4. nslookup to find ip

    $ nslookup www.google.com
    Server:		127.0.0.53
    Address:	127.0.0.53#53
    Non-authoritative answer:
    Name:	www.google.com
    Address: 142.251.130.4
    Name:	www.google.com
    Address: 2404:6800:4005:810::2004

    $ ip a #show all network interface and the ip
    $ netstat -tulpn | grep LISTEN #show all port open


5. Core DNS deploy as a pod in the cluster

    kube-system        coredns-5d78c9869d-8gvhc                  1/1     Running   0          2d23h
    kube-system        coredns-5d78c9869d-rg2t7                  1/1     Running   0          2d23h

6. NodePort

    expose your app outside the world, publib can access http://<node-ip>:33038
    33038 is a port k8s auto generate


6. Ingress

    k8s loadbalancer layer + ssl + http rule
    tool: nginx, HAproxy, trafix
    not deploy by default