class docker_hardening::garethr (
        $version = '1.6',
        )
{
    class { 'docker':
        version              => $version,
    }
}
