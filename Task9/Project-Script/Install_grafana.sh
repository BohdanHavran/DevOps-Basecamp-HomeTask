#!/bin/bash
sudo apt-get -y update
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/oss/release/grafana_9.3.2_amd64.deb
sudo dpkg -i grafana_9.3.2_amd64.deb
sudo sed -i.bak 's/;http_port = 3000/http_port = 80/g' /etc/grafana/grafana.ini
sudo sed -i.bak 's/CapabilityBoundingSet=/CapabilityBoundingSet=CAP_NET_BIND_SERVICE/g' /lib/systemd/system/grafana-server.service
sudo sed -i.bak  '/Service/a AmbientCapabilities=CAP_NET_BIND_SERVICE' /lib/systemd/system/grafana-server.service
sudo sed -i.bak '/Service/a PrivateUsers=false' /lib/systemd/system/grafana-server.service
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
