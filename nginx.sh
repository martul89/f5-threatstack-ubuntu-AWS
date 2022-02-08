#!/bin/bash

#Get IP
local_ipv4="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"

#Utils
sudo apt-get install unzip
sudo apt-get install curl

WantedBy=multi-user.target
EOF

#Execute Threatstack agent installation

curl https://app.threatstack.com/APT-GPG-KEY-THREATSTACK | sudo apt-key add -
echo "deb https://pkg.threatstack.com/v2/Ubuntu `lsb_release -c | cut -f2` main" | sudo tee /etc/apt/sources.list.d/threatstack.list > /dev/null
sudo apt-get update && sudo apt-get install threatstack-agent -y && \
sudo tsagent setup --deploy-key=(INSERT_KEY) --ruleset="Base Rule Set" && \ #Please fill in the deployment key you get from the threatstack
sudo systemctl start threatstack

