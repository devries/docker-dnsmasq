FROM ubuntu:20.04
MAINTAINER Christopher De Vries <devries@idolstarastronomer.com>

RUN apt-get update && apt-get install -y dnsmasq dnsutils && apt-get clean

RUN echo "addn-hosts=/etc/althosts" >> /etc/dnsmasq.conf
RUN echo "user=root" >> /etc/dnsmasq.conf
RUN echo "log-queries=extra" >> /etc/dnsmasq.conf

EXPOSE 53

CMD ["/usr/sbin/dnsmasq","-d","--log-facility=-"]
