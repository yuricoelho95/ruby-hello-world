FROM centos/ruby-22-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
# Custom packages - PH
USER root
RUN yum install -y nfs-utils ; \
    mkdir /ruby-page ; \
    curl -o /opt/app-root/src/ "https://www.redhat.com/sysadmin/sites/default/files/styles/embed_large/public/2019-09/Anbile-Tower-strategy.png" ;
USER default
COPY . /opt/app-root/src/
RUN scl enable rh-ruby22 "bundle install"
CMD ["scl", "enable", "rh-ruby22", "./run.sh"]
USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
