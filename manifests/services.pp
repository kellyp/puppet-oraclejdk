# oraclejdk::services
#
# This module manages services for oraclejdk.
class oraclejdk::services {
  require("oraclejdk::packages")
  require("oraclejdk::config")
}
