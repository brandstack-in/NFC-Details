node 'puppet-agent-1.ap-south-2.compute.internal' {

  package { 'apache2':
    ensure => present,
  }

  file { '/var/www/html/index.html':
    ensure  => file,
    content => "<h1>Managed by Puppet</h1>\n",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['apache2'],
  }

  service { 'apache2':
    ensure => running,
    enable => true,
  }

}
