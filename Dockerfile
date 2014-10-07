From centos:centos6

# add EPEL repo
RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# install development tools
RUN yum -y groupinstall "Development Tools"

# install postgres repo
RUN rpm -i http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm

# install postgres server
RUN yum install -y postgresql93-server postgresql93-contrib

# initialize DB data files
RUN su - postgres -c '/usr/pgsql-9.3/bin/initdb -D /var/lib/pgsql/data'

# start the database
CMD su - postgres -c '/usr/pgsql-9.3/bin/postgres -D /var/lib/pgsql/data' 

