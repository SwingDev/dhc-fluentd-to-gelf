FROM fluent/fluentd:v0.14-latest
MAINTAINER Tomek Kopczuk <tkopczuk@gmail.com>

WORKDIR /home/fluentd

USER root
RUN apk --no-cache --update add sudo build-base ruby-dev && \
    sudo -u fluent gem install --no-document gelf && \

    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev && rm -rf /var/cache/apk/*

COPY fluent.conf /fluentd/etc/

RUN mkdir -p /etc/fluent/plugin
COPY plugin/out_gelf.rb /etc/fluent/plugin

EXPOSE 24224

USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
