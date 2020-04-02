#!/bin/bash
/sbin/iptables -I INPUT -s 117.6.80.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 117.6.80.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 117.6.112.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 117.6.112.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 117.3.40.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 117.3.40.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 117.3.56.0/21 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 117.3.56.0/21 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 115.78.112.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 115.78.112.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 115.78.116.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 115.78.116.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 115.78.124.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 115.78.124.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 115.78.192.0/20 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 115.78.192.0/20 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 115.78.80.0/21 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 115.78.80.0/21 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.144.0/21 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.144.0/21 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.26.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.26.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.185.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.185.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.186.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.186.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.187.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.187.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.241 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.241 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.242 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.242 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.243 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.243 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.244 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.244 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.245 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.245 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.246 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.246 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.64.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.64.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.108.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.108.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.118.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.118.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.124.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.124.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.126.0/23 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.126.0/23 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.144.0/20 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.144.0/20 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.70.57.0/24 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.70.57.0/24 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.70.108.0/22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.70.108.0/22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.70.120./22 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.70.120./22 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.199 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.199 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.206 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.206 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.94 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.94 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.76 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.76 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.82 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.82 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.93 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.93 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.107 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.107 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.70 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.70 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.89 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.89 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.106 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.106 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.64.15 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.64.15 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.92 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.92 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.104 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.104 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.2 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.2 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.10 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.10 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.0 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.0 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.16 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.16 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.20 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.20 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.25 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.25 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.88 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.88 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.150.144 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.150.144 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.23 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.23 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.96 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.96 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.217 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.217 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.197 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.197 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.216 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.216 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.147.135 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.147.135 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.66 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.66 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.74 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.74 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.219 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.219 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.220 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.220 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.6 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.6 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.68 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.68 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.1 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.1 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.19 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.19 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.14 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.14 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.15 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.15 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.27 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.27 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.18 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.18 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.13 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.13 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.64.104 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.64.104 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.12 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.12 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.7 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.7 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.192 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.192 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.64.123 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.64.123 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.200 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.200 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.203 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.203 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.198 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.198 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.64.205 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.64.205 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.193 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.193 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.205 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.205 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.196 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.196 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.195 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.195 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.214 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.214 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.204 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.204 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.225 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.225 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.158.67 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.158.67 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.227 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.227 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.224 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.224 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.3 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.3 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.5 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.5 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.4 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.4 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.9 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.9 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.26 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.26 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.8 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.8 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.150.90 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.150.90 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.71 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.71 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.105 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.105 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.213 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.213 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.194 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.194 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.215 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.215 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.87 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.87 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.83 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.83 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.72 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.72 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 1.53.113.111 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 1.53.113.111 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.65 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.65 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.73 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.73 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.64 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.64 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.75 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.75 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.97 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.97 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.69 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.69 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.90 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.90 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.67 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.67 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.201 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.201 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.221 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.221 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 118.69.183.202 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 118.69.183.202 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 123.20.120.11 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 123.20.120.11 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 123.20.10.128 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 123.20.10.128 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.238 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.238 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.93.175 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.93.175 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 123.21.47.17 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 123.21.47.17 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.219 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.219 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.217 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.217 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.76 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.76 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.245 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.245 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.93.116 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.93.116 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.88.247 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.88.247 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.93.235 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.93.235 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.95.138 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.95.138 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.35 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.35 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.77 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.77 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.223 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.223 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.72 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.72 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.95.172 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.95.172 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.95.146 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.95.146 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.95.132 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.95.132 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 113.161.94.13 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 113.161.94.13 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.37 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.37 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.29 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.29 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.31 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.31 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.28 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.28 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.85 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.85 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 119.15.184.129 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 119.15.184.129 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.1 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.1 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.2 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.2 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.3 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.3 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.4 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.4 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.5 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.5 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.6 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.6 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.7 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.7 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.8 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.8 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
/sbin/iptables -I INPUT -s 183.91.27.9 -i eth0 -p tcp -m tcp --dport 80 -j DROP
/sbin/iptables -I INPUT -s 183.91.27.9 -i eth0 -p tcp -m tcp --dport 80 -j LOG --log-prefix '[NET CENTER] ' --log-level 4
