class docker_hardening::garethr (
        $version = '1.7.0',
        )
{
    class { 'docker':
        version              => $version,
    }
}
