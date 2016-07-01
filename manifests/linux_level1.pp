class puppet_security::linux_level1 (
  $checking = true,
){
  service { 'firewalld':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    noop      => $checking,
  }

  file_line { 'PermitRootLogin':
    path  => '/etc/ssh/sshd_config',
    line  => 'PermitRootLogin no',
    match => 'PermitRootLogin',
    noop  => $checking,
  }

  package { 'openssl':
    ensure => latest,
    noop   => $checking,
  }

}
