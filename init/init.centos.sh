# Config firewall
firewall-cmd --zone=public --add-port=8388/tcp --permanent
firewall-cmd --zone=public --add-port=8787/tcp --permanent
firewall-cmd --zone=public --add-port=9006/tcp --permanent
firewall-cmd --reload

# Add shadowsocks systemd service
cp ./shadowsocksr.service /usr/lib/systemd/system/
systemctl enable shadowsocksr.service

# Config bbr
cat ./sysctl.conf > /etc/sysctl.conf
sysctl -p
systemctl restart shadowsocksr.service
