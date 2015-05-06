FROM java:8

RUN curl  -o bamboo-server.tar.gz -SL https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-5.8.1.tar.gz

RUN mkdir -p /opt/bamboo

ENV BAMBOO_INSTALL_HOME /opt/bamboo

RUN tar -xzvf bamboo-server.tar.gz -C /opt/bamboo --strip 1

RUN mkdir -p /var/bamboo

ENV BAMBOO_HOME /var/bamboo

RUN echo "bamboo.home=$BAMBOO_HOME" >> $BAMBOO_INSTALL_HOME/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

ADD bamboo.init /etc/init.d/bamboo

RUN chmod \+x /etc/init.d/bamboo

RUN update-rc.d bamboo defaults

RUN ls /var/log

RUN touch /var/log/bamboo.log

ADD run.sh run.sh

RUN chmod +x run.sh

CMD /run.sh
