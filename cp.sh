ifconfig wlp5s1 192.169.5.1/24
rm /var/lib/dhcp/dhcpd.leases
touch /var/lib/dhcp/dhcpd.leases
dhcpd -cf /etc/dhcp/dhcpd.conf
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o enp3s0f0 -j MASQUERADE
cd /etc/apache2/sites-available;./ipt.sh
function login(){
	while :
	do
	a=`date | cut -c 12-16`
	if [ $a == "00:00" ];then
        	cd /etc/apache2/sites-available/;./ipt.sh
	fi
	done
}
login&
hostapd -B /etc/hostapd/hostapd.conf 
