Facter.add('sectest_l1_firewall_on') do
  confine :kernel => 'Linux'
  setcode do
    firewall_state = Facter::Core::Execution.execute('firewall-cmd --state')
    if firewall_state == 'running'
      'pass'
    else
      'fail'
    end
  end
end
