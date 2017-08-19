 + get-interface
 ifconfig ip iw iwconfig iwlist

 + open-interface
 ip link set <interface> up
   
 + get-essid
 iwlist <interface> scan | grep 'ESSID'
iw [dev] <interface> scan | grep -i 'ssid*'
 mv wpa_supplicant.conf wpa_supplicant.conf.bak

wpa_supplicant
wpa_passphrase
usage: wpa_passphrase <ssid> [passphrase]


 + write to file
  wpa_passphrase essid psk|password >> /etc/wpa_supplicant/wpa_supplicant.conf

  wpa_supplicant -i <interface> -c path&file 

 + get-ipaddreess
dhcpcd <interface> 
dhclient <interface>

 + test network
 ping -c 3 www.google.com

 + show network-info
iwconfig <interface> 
iw dev <interface> 
 If passphrase is left out, it will be read from stdin
