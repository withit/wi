set :vhost,  "staging.wi.com.au"
set :user, 'withit'
set :deploy_to, "/var/www/vhosts/#{vhost}/httpdocs/apps/#{application}"