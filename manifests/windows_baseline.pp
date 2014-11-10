class profile::windows_baseline {

  require registry
  #include win_rdp
  
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

  package { 'Firefox': }

  package { 'notepadplusplus': }

  package { '7zip': }

  package { 'git': }

}
