require 'spec_helper'
require 'rspec-puppet'
require 'hiera'
require 'facter'

hiera_config = 'spec/fixtures/hiera/hiera.yaml'
# the describe has to be the main class name
describe 'docker_hardening' do
  let(:hiera_config) { hiera_config }
  let(:params) { {:provider => 'garethr/docker'} }
  context 'with hiera config on Debian' do
    let(:facts) { {:osfamily => 'Debian', :lsbdistid => 'Debian', :operatingsystem => 'Debian' } }
    it { should contain_class('docker_hardening') }
    end # fin context 'with hiera on Debian'
end # fin describe 'docker_hardening'
