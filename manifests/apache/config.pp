# == Class: php::apache::config
#
# Configure php.ini settings for a PHP SAPI
#
# === Parameters
#
# [*file*]
#   The path to ini file
#
# [*config*]
#   Array of augeas commands, one command per entry
#
# === Variables
#
# No variables
#
# === Examples
#
# TODO
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Robin Gloster <robin.gloster@mayflower.de>
#
# === Copyright
#
# See LICENSE file
#
define php::apache::config(
  $file   = $php::params::apache_inifile,
  $config = [],
) {

  if $caller_module_name != $module_name {
    warning("${name} is not part of the public API of the ${module_name} module and should not be directly included in the manifest.")
  }

  php::config { "apache-${name}":
    file      => $file,
    config    => $config,
    notify    => Service[$php::params::apache_service_name],
  }
}