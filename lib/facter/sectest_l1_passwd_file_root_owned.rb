Facter.add('sectest_l1_passwd_file_root_owned') do
  confine :kernel => 'Linux'
  setcode do
    passwd_file_owner = Facter::Core::Execution.exec("/bin/stat -c \%U /etc/passwd")
    if passwd_file_owner == /root/
      'pass'
    else
      'fail'
    end
  end
end
