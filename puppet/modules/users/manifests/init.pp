
class users {
  user { 'tamasuper':
      ensure     => present,
      shell      => '/bin/bash',
      home       => '/home/tamasuper',
  }
}