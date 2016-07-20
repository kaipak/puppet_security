Facter.add('sectest_l1_passwd_file_root_owner') do
  confine :kernel => 'Linux'
  setcode do
    passwd_file_perms = Facter::Core::Execution.exec("/bin/stat -c \%a /etc/passwd")
    if passwd_file_owner == /644/
      'pass'
    else
      'fail'
    end
  end
end
