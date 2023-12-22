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

