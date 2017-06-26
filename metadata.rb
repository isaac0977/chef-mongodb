name              'mongodb'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs and configures mongodb'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'

recipe 'mongodb', 'Installs and configures a single node mongodb instance'
recipe 'mongodb::mongos', 'Installs and configures a mongos which can be used in a sharded setup'
recipe 'mongodb::configserver', 'Installs and configures a configserver for mongodb sharding'
recipe 'mongodb::shard', 'Installs and configures a single shard'
recipe 'mongodb::replicaset', 'Installs and configures a mongodb replicaset'
recipe 'mongodb::mms_monitoring_agent', 'Installs and configures a MongoDB MMS Monitoring Agent'
recipe 'mongodb::mms_backup_agent', 'Installs and configures a MongoDB MMS Backup Agent'

depends 'apt', '>= 1.8.2'
depends 'yum', '>= 3.0'
depends 'build-essential', '>= 5.0.0'

%w(
  amazon
  centos
  debian
  oracle
  redhat
  ubuntu
).each do |os|
  supports os
end

source_url 'https://github.com/sous-chefs/mongodb' if respond_to?(:source_url)
issues_url 'https://github.com/sous-chefs/mongodb/issues' if respond_to?(:issues_url)
chef_version '>= 12.5' if respond_to?(:chef_version)


attribute 'mongodb/config/dbpath',
          :display_name => 'dbpath',
          :description => 'Path to store the mongodb data',
          :default => '/var/lib/mongodb'

attribute 'mongodb/config/logpath',
          :display_name => 'logpath',
          :description => 'Path to store the logfiles of a mongodb instance',
          :default => '/var/log/mongodb/mongodb.log'

attribute 'mongodb/config/port',
          :display_name => 'Port',
          :description => 'Port the mongodb instance is running on',
          :default => '27017'

attribute 'mongodb/reload_action',
          :display_name => 'Reload',
          :description => 'Action to take when MongoDB config files are modified',
          :default => 'restart'

attribute 'mongodb/client_roles',
          :display_name => 'Client Roles',
          :description => 'Roles of nodes who need access to the mongodb instance',
          :type => 'array',
          :default => []

attribute 'mongodb/cluster_name',
          :display_name => 'Cluster Name',
          :description => 'Name of the mongodb cluster, all nodes of a cluster must have the same name.',
          :default => ''

attribute 'mongodb/shard_name',
          :display_name => 'Shard name',
          :description => 'Name of a mongodb shard',
          :default => 'default'

attribute 'mongodb/sharded_collections',
          :display_name => 'Sharded Collections',
          :description => 'collections to shard',
          :type => 'array',
          :default => []

attribute 'mongodb/config/replSet',
          :display_name => 'Replicaset Name',
          :description => 'Name of a mongodb replicaset',
          :default => ''

attribute 'mongodb/config/rest',
          :display_name => 'Enable Rest',
          :description => 'Enable the ReST interface of the webserver'

attribute 'mongodb/config/smallfiles',
          :display_name => 'Use small files',
          :description => 'Modify MongoDB to use a smaller default data file size'

attribute 'mongodb/config/bind_ip',
          :display_name => 'Bind address',
          :description => 'MongoDB instance bind address',
          :default => ''

attribute 'mongodb/package_version',
          :display_name => 'MongoDB package version',
          :description => 'Version of the MongoDB package to install',
          :default => ''

attribute 'mongodb/configfile',
          :display_name => 'Configuration File',
          :description => 'Name of configuration file to use with when starting mongod/mongos vs command line options',
          :default => ''

attribute 'mongodb/config/nojournal',
          :display_name => 'Disable Journals',
          :description => 'Journals are enabled by default on 64bit after mongo 2.0, this can disable it',
          :default => 'false'

attribute 'mongodb/mms_agent',
          :display_name => 'MMS Agent',
          :description => 'Hash of MMS Agent attributes',
          :type => 'hash'

attribute 'mongodb/mms_agent/api_key',
          :display_name => 'MMS Agent API Key',
          :default => ''

attribute 'mongodb/mms_agent/monitoring',
          :display_name => 'MMS Monitoring Agent',
          :description => 'Hash of MMS Monitoring Agent attributes',
          :type => 'hash'

attribute 'mongodb/mms_agent/monitoring/version',
          :display_name => 'MMS Monitoring Agent version',
          :description => 'Version of MMS Monitoring Agent to install',
          :default => '2.0.0.17-1'

attribute 'mongodb/mms_agent/backup',
          :display_name => 'MMS Backup Agent',
          :description => 'Hash of MMS Backup Agent attributes',
          :type => 'hash'

attribute 'mongodb/mms_agent/backup/version',
          :display_name => 'MMS Backup Agent version',
          :description => 'Version of MMS Backup Agent to install',
          :default => '1.4.3.28-1'
