#!/bin/bash

set -e

echo "Starting dnsmasq server..."
echo ""
echo "Default nameservers: "
grep "server" /etc/dnsmasq.conf
echo ""
echo "althosts entries: "
cat /etc/althosts

/etc/init.d/dnsmasq start

# watch for changes in /mnt and update nginx if there is one on /mnt/proxy
while true; do

  inotifywait -e close_write,moved_to,create /etc/althosts  && \
  /etc/init.d/dnsmasq restart

done
