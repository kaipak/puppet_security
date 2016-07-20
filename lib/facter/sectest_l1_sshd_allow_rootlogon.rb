Facter.add('sectest_l1_sshd_allow_rootlogon') do
  confine :kernel => 'Linux'
  setcode do
    # Check if PermitRootLogin is allowed.
    permitRootLogin = Facter::Core::Execution.execute('/bin/grep PermitRootLogin /etc/ssh/sshd_config | cut -d \' \' -f2').chomp
    if permitRootLogin == 'yes'
      'fail'
    else
      'pass'
    end
  end
end
