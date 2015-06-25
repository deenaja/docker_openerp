# Pull base image.
FROM postgres:9.4
RUN apt-get update -y
RUN apt-get install -y python-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y python-pip
RUN apt-get install -y libjpeg-dev libfreetype6-dev zlib1g-dev libjpeg8-dev
RUN apt-get install -y libpng3
RUN apt-get install -y libxml2-dev libxslt1-dev
RUN apt-get install -y python-dev libldap2-dev libsasl2-dev libssl-dev
ADD odoo openerp/
RUN pip install -r /openerp/requirements.txt
RUN adduser --system --group --home /var/lib/openerp --shell /bin/bash openerp
ADD service-start /usr/local/bin/
RUN chmod +x /usr/local/bin/service-start
WORKDIR /home
CMD ["service-start"]
