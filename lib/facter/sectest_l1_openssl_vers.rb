Facter.add('sectest_l1_openssl_vers') do
  confine :kernel => 'Linux'
  setcode do
    Facter::Core::Execution.exec("/bin/openssl version | /bin/awk '{print $2}'")
  end
end
