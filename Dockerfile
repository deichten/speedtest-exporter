FROM balenalib/raspberrypi3-debian:buster-run

# reusing Port as of dicumentation: https://github.com/prometheus/prometheus/wiki/Default-port-allocations
EXPOSE 9516

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61 && \
    echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list && \
    install_packages speedtest jq

ADD speedtest-cli.json $HOME/.config/ookla/speedtest-cli.json

CMD ["/bin/bash"]
