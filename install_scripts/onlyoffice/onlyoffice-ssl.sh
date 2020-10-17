docker run -i -t -d --restart=always --name onlyoffice -p 8443:443 \
  -v onlyoffice_data:/var/www/onlyoffice/Data \
  -v onlyoffice_custom:/usr/share/fonts/truetype/custom \
  -v onlyoffice_lib:/var/lib/onlyoffice \
  -v onlyoffice_postgresql:/var/lib/postgresql \
  -v onlyoffice_rabbitmq:/var/lib/rabbitmq \
  -v onlyoffice_redis:/var/lib/redis \
  -v onlyoffice_log:/var/log/onlyoffice \
  onlyoffice/documentserver:5.4.2.46
