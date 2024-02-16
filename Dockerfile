FROM verdaccio/verdaccio:latest

ENV VERDACCIO_APPDIR /verdaccio/conf

COPY config.yaml $VERDACCIO_APPDIR/config.yaml

USER root

RUN touch $VERDACCIO_APPDIR/htpasswd && \
    chmod 777 $VERDACCIO_APPDIR/htpasswd

USER verdaccio

CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml"]
