#
# The staging profile is used to set up the staging module. It provides a
# single place to adjust staging class parameters.
#
class profile::staging {
   case $::osfamily {
    default: {
      class { '::staging':
        path  => '/var/staging',
      }
    }
    'windows': {
      class { '::staging':
        path  => 'C:/staging',
      }
    }
  }
}
