Facter.add('sectest_l1_openssl_vers') do
  confine :kernel => 'Linux'
  setcode do
    openssl_vers = Facter::Core::Execution.exec("/bin/openssl version | /bin/awk '{print $2}'")
  end
  if openssl_vers =~ /1.0.1/
    'pass'
  else
    'fail'
  end
end
