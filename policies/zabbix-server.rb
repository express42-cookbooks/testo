instance_eval(IO.read('policies/base.rb'))

name 'zabbix-server'

cookbook 'nginx', git: 'git@github.com:evilmartians/chef-nginx'
cookbook 'php-fpm'
cookbook 'postgresql_lwrp'
cookbook 'zabbix_lwrp'
cookbook 'zabbix_templates', git: 'git@github.com:express42-cookbooks/zabbix_templates.git'

default['zabbix']['version'] = '3.2'
default['zabbix']['api-version'] = '3.1.0'

run_list.concat([
                  'nginx::official-repo',
                  'postgresql_lwrp::apt_official_repository',
                  'zabbix_lwrp::default',
                  'zabbix_lwrp::host',
                  'zabbix_lwrp::partition',
                  'zabbix_lwrp::database',
                  'zabbix_lwrp::server',
                  'zabbix_lwrp::web',
                  'zabbix_templates::default',
                  'zabbix_templates::linux',
                  'zabbix_templates::postgresql',
                  'zabbix_templates::zabbix-server',
                  'zabbix_lwrp::connect',
                ])
