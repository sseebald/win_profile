class profile::windows_baseline {

  require registry
  
  reboot { 'before install':
    when => pending,
  }

  Package {
    ensure   => installed,
    provider => chocolatey,
  }

  class { 'pe_windows_shortcuts':
    user => 'vagrant',
  }

  #turn off windows firewall

  exec { 'turn off firewall':
    command  => '$(netsh advfirewall set currentprofile state off)',
    onlyif   => ' if ((netsh advfirewall show currentprofile | Select-String "State" | Out-String).Replace(" ","").Replace("State","").Replace("`r`n","") = "ON" { exit 0 }',
    provider => powershell,
  }

  package { 'Firefox': }

  package { 'notepadplusplus': }

  package { '7zip': }

  package { 'git': }

}
