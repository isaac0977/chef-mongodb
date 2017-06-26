include_attribute 'sc-mongodb::default'

# mongod defaults
default['mongodb']['sysconfig']['mongod']['DAEMON'] = '/usr/bin/$NAME'
default['mongodb']['sysconfig']['mongod']['DAEMON_USER'] = node['mongodb']['user']
default['mongodb']['sysconfig']['mongod']['DAEMON_OPTS'] = "--config #{node['mongodb']['dbconfig_file']['mongod']}"
default['mongodb']['sysconfig']['mongod']['CONFIGFILE'] = node['mongodb']['dbconfig_file']['mongod']
default['mongodb']['sysconfig']['mongod']['ENABLE_MONGODB'] = 'yes'


