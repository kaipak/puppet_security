class puppet_security::level1 (
  $ensure   = 'running',
  $checking = true,
){
  service { 'firewalld':
    ensure    => $ensure,
    enable    => true,
    hasstatus => true,
    noop      => $checking,
  }

  file_line { 'PermitRootLogin':
    path  => '/etc/ssh/sshd_config',
    line  => 'PermitRootLogin no',
    match => 'PermitRootLogin',
    noop      => $checking,
  }

  package { 'openssl':
    ensure => latest,
    noop   => $checking,
  }

}
