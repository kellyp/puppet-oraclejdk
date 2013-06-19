# oraclejdk::packages
#
# This module installs packages for oraclejdk.
class oraclejdk::packages {
  $packages = []

  package { $packages: ensure => installed }
}
