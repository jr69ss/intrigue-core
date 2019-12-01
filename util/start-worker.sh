#! /bin/bash

# Set path to include rbenv
source /root/.bash_profile

echo "[+] Setting up Intrigue Worker"
bundle exec rake db:migrate
bundle exec rake setup

echo "[+] Enabling Intrigue Services"
god -c /core/util/god/intrigue-docker.rb
god start intrigue

echo "[+] Tailing worker log"
tail -f /core/log/worker.log
