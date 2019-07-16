
for (( i=2; i<255; i++))
do
iptables -A FORWARD -p tcp -s 192.169.5.$i --dport 1:52 -j DROP
iptables -A FORWARD -p udp -s 192.169.5.$i --dport 1:52 -j DROP
iptables -A FORWARD -p tcp -s 192.169.5.$i --dport 54:79 -j DROP
iptables -A FORWARD -p udp -s 192.169.5.$i --dport 54:79 -j DROP
iptables -A FORWARD -p tcp -s 192.169.5.$i --dport 81:7000 -j DROP
iptables -A FORWARD -p udp -s 192.169.5.$i --dport 81:7000 -j DROP
iptables -t nat -A PREROUTING -p tcp -s 192.169.5.$i --dport 80 -j REDIRECT --to-port 82
iptables -t nat -A PREROUTING -p tcp -s 192.169.5.$i --dport 443 -j REDIRECT --to-port 443
done

