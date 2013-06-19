# Install Oracle JDK.
class oraclejdk {
	include oraclejdk::packages
	include oraclejdk::services
	include oraclejdk::config

  $jdk_url = "https://dl.dropboxusercontent.com/u/2219585/jdk-7u25-linux-x64.rpm"

  package { 'wget': ensure => installed }

  exec { 'download-jdk':
    require => Package['wget'],
    command => "/usr/bin/wget -O /var/tmp/jdk.rpm $jdk_url --no-check-certificate",
    creates => "/var/tmp/jdk.rpm",
  }

  exec { 'install-jdk':
    require => Exec['download-jdk'],
    command => '/usr/bin/yum -y -d0 install /var/tmp/jdk.rpm',
    unless  => '/bin/rpm -q jdk',
  }

$str = "PATH=/usr/java/default/bin:$PATH
JAVA_HOME=/usr/java/default
export PATH JAVA_HOME
        "

  file { '/etc/profile.d/java.sh':
    content => "$str",
    owner   => root,
    group   => root,
    mode    => 0644,
  }

}

