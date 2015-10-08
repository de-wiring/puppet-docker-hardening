# == Class: docker_hardening
#
# Configures overlay hardening
#
# === Parameters
#
# [*provider*]
#   The name of the provider you use to install docker.
#   Supported: `garethr/docker`
#
class docker_hardening(
  $provider = 'garethr/docker',
) {
  case $provider {
    'garethr/docker': {
      class{ 'docker_hardening::garethr': }
    }
    'none': {
      fail('You haven\'t configured a Docker provider for hardening.')
    }
    default: {
      fail('Unrecognized/Unsupported Docker provider for hardening.')
    }
  }
}
