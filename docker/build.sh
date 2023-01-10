#!/bin/bash

ft_proj_name=$1

apt-get update -y && \
  apt-get install -y sudo software-properties-common dialog apt-utils vim curl wget && \
  echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get install -y python3 pip nginx

curl -o /root/allure_2.18.1-1_all.deb https://github.com/allure-framework/allure2/releases/download/2.18.1/allure_2.18.1-1_all.deb
dpkg -i /root/allure_2.18.1-1_all.deb
# apt autoremove -y
apt --fix-broken install -y

pip install pytest==6.2.5 pytest-html==3.0.0 pytest-xdist==2.1.0 pytest-rerunfailures==9.1.1 \
  allure-pytest==2.8.18 requests==2.24.0 requests-toolbelt==0.9.1 simplejson==3.17.2 ruamel.yaml==0.16.12 \
  PyYAML==5.3.1 configparser==5.0.0 python-dateutil==2.8.0 -i https://pypi.tuna.tsinghua.edu.cn/simple

cat > /etc/nginx/conf.d/$ft_proj_name.conf << EOF
server {
   listen       10000;
   listen       [::]:10000;
   root         /root/ApiTesting/$ft_proj_name/report/html;
}
EOF

# use root user
sed -i 's/www-data/root/g' /etc/nginx/nginx.conf
