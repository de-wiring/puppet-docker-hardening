require 'spec_helper'
require 'rspec-puppet'
require 'hiera'
require 'facter'

hiera_config = 'spec/fixtures/hiera/hiera.yaml'
# the describe has to be the main class name
describe 'docker_hardening' do
  let(:hiera_config) { hiera_config }
  let(:params) { { provider: 'garethr/docker' } }
  context 'with hiera config on Debian' do
    let(:facts) {
      {
        osfamily: 'Debian',
        lsbdistid: 'Debian',
        operatingsystem: 'Debian'
      }
    }
    it { should contain_class('docker_hardening') }
    it { should contain_class('docker_hardening::garethr') }
  end # fin context 'with hiera on Debian'

  context 'with provider set to none fail' do
    let (:params) { { provider: 'none' } }
    it do
      expect {
        should contain_class('docker_hardening')
      }.to raise_error(Puppet::Error, /You haven't configured a Docker provider for hardening/)
    end
  end
end # fin describe 'docker_hardening'
