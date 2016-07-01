# Requires ayohrling/local_security_policy
class puppet_security::windows_level1 (
  $checking = true,
){

  local_security_policy { 'Maximum password age':
    ensure       => present,
    policy_value => '90',
    noop         => $checking,
  }

  local_security_policy { 'Audit account logon events':
    ensure       => present,
    policy_value => 'Success,Failure',
    noop         => $checking,
  }

  local_security_policy { 'Password must meet complexity requirements':
    ensure       => present,
    policy_value => '1',
    noop         => $checking,
  }

}
