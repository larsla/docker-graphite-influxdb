FROM ubuntu:14.04

RUN apt-get update && apt-get install -y libpython-dev python-pip gcc libffi-dev libcairo2 libcairo2-dev git && apt-get clean

RUN pip install https://github.com/Dieterbe/graphite-api/tarball/support-templates2
RUN pip install graphite-api[cache] gunicorn
RUN pip install git+https://github.com/vimeo/graphite-influxdb.git#egg=graphite-influxdb

ADD graphite-api.yaml /etc/graphite-api.yaml

VOLUME /srv/graphite

CMD /usr/local/bin/gunicorn -b 0.0.0.0:8000 -w 2 --timeout 120 --log-level info graphite_api.app:app
