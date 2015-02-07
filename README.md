# Dockerized Dnsmasq Image

The Dockerfile included in the repository creates an image based on the
ubuntu14.04 image with dnsmasq installed. When run without arguments dnsmasq
is run by root in the console mode.

Dnsmasq is configured to run on port 53 to use standard `resolv.conf` DNS
resolution, and to read hosts from `/etc/hosts` as well as `/etc/althosts`. It
can therefore be used for service discovery by populating an `althosts` file.
For example, create an althosts file with entries

~~~~
192.168.1.3 server1
192.168.1.4 server2
192.168.1.5 server3
~~~~

And then run the server:

~~~~
docker run -d -v /path/to/althosts:/etc/althosts -p 53:53/udp devries/dnsmasq
~~~~

DNS requests for `server1`, `server2`, and `server3` will now show up as
192.1681.3, 192.168.1.4, and 192.168.1.5 respectively.

> For convenience, on the "autoreload" branch an inotify task is present to
restart the server whenever it detects changes to the `/etc/althosts` file.
Thus, if you volume mount your althosts file as demostrated above, simply
editing the text file on the host will automatically be reflected in the
server. DO NOT DO THIS IN PRODUCTION!!!

Many thanks to Rion Dooley for contributing the inotify addition.
