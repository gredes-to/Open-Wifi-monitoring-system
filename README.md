# open-wifi-monitoring-system
Access Point Monitoring

This project consists in allowing anyone to create a network with interconnected APs when just one of them have internet, and the others by Ad-hoc connection take this internet and deliver by wlan, and you can monitor them using a captive portal and a script in the terminal. First of all you will need to have some softwares installed in your computer,  they are:

-Hostapd
-DHCP
-Apache
-PHP
-A database (we use mysql workbench)

After you have these software you need to run the tudo.sh in the aps and in the main machine run the cp.sh. In this point you can use the captive portal to allow you to use your internet with a login system, the captive portal works as follows: when somenone connect to one of the APS automatically the scripts redirect the user to the captive portal page when the user have to login with a pre-login that is in the database. So when the user logs in the script takes the MAC address of his equipment making the login unique to each one.

To use the monitoring system to see how many people are using your internet in the APs and see the largeband used. You have to run access-point.sh in each AP and then run the server.sh in the main machine.
