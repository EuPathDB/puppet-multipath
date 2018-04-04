class multipath {

  package { ['device-mapper-multipath']:
    ensure => installed,
  }

  file { '/etc/multipath.conf':
    source => 'puppet:///modules/multipath/multipathd.conf',
  }

  service { 'multipathd':
   enable    => true,
   ensure    => running,
   require   => Package['device-mapper-multipath'],
   subscribe => File['/etc/multipath.conf'],
  }

  # if hiera("use_nagios") == true {
  #   @@nagios_service { "nrpe_multipath_${hostname}":
  #     use => "nrpe-multipath",
  #     host_name => "$fqdn",
  #     ensure => present,
  #     tag => "public",
  #   }
  


}
