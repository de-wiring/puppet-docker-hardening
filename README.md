# puppet-docker-hardening
Puppet repository/module for hardening docker on host and daemon level. See also [tests-docker-hardening](http://github.com/de-wiring/tests-docker-hardening.git).

## Local Testing

For local testing you can use vagrant and Virtualbox of VMWare to run tests locally. You will have to install Virtualbox and Vagrant on your system. See [Vagrant Downloads](http://downloads.vagrantup.com/) for a vagrant package suitable for your system. For all our tests we use `test-kitchen`. If you are not familiar with `test-kitchen` please have a look at [their guide](http://kitchen.ci/docs/getting-started).

Next install test-kitchen:

```bash
# Install dependencies
gem install bundler
bundle install

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# Do lint checks
bundle exec rake lint

# Do spec checks
bundle exec rake spec

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on Debian-based machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

For more information see [test-kitchen](http://kitchen.ci/docs/getting-started)
