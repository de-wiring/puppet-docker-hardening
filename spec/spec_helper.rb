require 'rspec-puppet'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'mocha'
require 'hiera'
require 'facter'

RSpec.configure do |c|
  c.fail_fast = true
end

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))

support_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec/support/*.rb'))
Dir[support_path].each {|f| require f}


## Rspec Config
#
RSpec.configure do |c|
  c.config = '/doesnotexist'
  c.manifest_dir = File.join(fixture_path, 'manifests')
# c.module_path = File.join(fixture_path, 'modules')
  c.hiera_config = File.join(fixture_path, 'hiera/hiera.yaml')
  c.mock_with :mocha
  puts "Manifest Dir: #{c.manifest_dir}"
  puts "Module Path: #{c.module_path}"
end
at_exit { RSpec::Puppet::Coverage.report! }
### Rspec Config fin


