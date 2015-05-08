Talos Digital - docker scripts



```
# cat /etc/sysconfig/iptables
*nat
:PREROUTING ACCEPT [7:614]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:DOCKER - [0:0]
#-A PREROUTING -m addrtype --dst-type LOCAL -j DOCKER
#-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE
#-A POSTROUTING -o eth0 -j MASQUERADE
#-A OUTPUT ! -d 127.0.0.0/8 -m addrtype --dst-type LOCAL -j DOCKER
COMMIT

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
-A FORWARD --in-interface docker0 -j ACCEPT
:DOCKER - [0:0]
-A FORWARD -o docker0 -j DOCKER
-A FORWARD -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i docker0 ! -o docker0 -j ACCEPT
-A FORWARD -i docker0 -o docker0 -j ACCEPT
-A FORWARD -i docker0 -j ACCEPT
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
# Docker ports
-A INPUT -p tcp -m state --state NEW -m tcp --match multiport --dports 4000:9999  -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```
