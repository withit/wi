echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
sudo gem install haml
sudo gem install compass
gem sources -a http://gems.github.com
sudo rake gems:install RAILS_ENV=production

# Assembles Rails database.yml based on information
# provided from a ReadyStack redeploy
#
# WC_DB_ENGINE = [mysql|postgresql]
# WC_APP_NAME = The name of you app, the GitHub repo name
# WC_DB_PASSWORD = the DB password, chosen on the UI

# on old
#mysqldump suzanne_wi -u wi -p | gzip > wi_db.gz
#tar -cjf system.tar.bz2 ~/httpdocs/apps/bushit/shared/system

# on new
#scp withit_prod@203.145.48.37:private/wi_db.gz wi_db.gz
#scp withit_prod@203.145.48.37:private/wi_sys.zip wi_sys.zip

# gunzip < wi_db.gz | mysql wi -u root -p
# tar -xjf system.tar.bz2

#mysqldump -u wi -p suzanne_wi --default-character-set=latin1 --character-sets-dir=/usr/share/mysql/charsets  > latin1.sql

#mysql -u wi -p wi --default-character-set=utf8 --character-sets-dir=/usr/share/mysql/charsets < latin1.sql
#change in sql file /*!40101 SET NAMES utf8 */; or not
#passwd www-data
cd ..
mkdir initial
mv ${WC_APP_NAME}/* initial
mkdir -p ${WC_APP_NAME}/shared 
mv initial ${WC_APP_NAME}
cd ${WC_APP_NAME}
ln -s initial current
sed -i 's/public/current\/public/' /etc/apache2/sites-available/default
apache2ctl graceful

echo WC_DB_ENGINE=${WC_DB_ENGINE}
 
echo "
login: &login
  adapter: ${WC_DB_ENGINE}
  database: ${WC_APP_NAME}
  username: ${WC_APP_NAME}
  password: ${WC_DB_PASSWORD}
  host: localhost
" > shared/database.yml
 
if [ "${WC_DB_ENGINE}" == "mysql" ]; then
echo "
production:
  <<: *login
  encoding: utf8
" >> shared/database.yml
fi
 
if [ "${WC_DB_ENGINE}" == "postgresql" ]; then
echo "
production:
  <<: *login
  encoding: unicode
  pool: 5
  port: 5432
" >> config/database.yml
fi
rm current/config/database.yml
ln -s ../../shared/database.yml current/config/database.yml

