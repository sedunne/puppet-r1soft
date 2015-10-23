source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 0.8.2'
gem 'puppet-lint', '>= 1.0.0'
gem 'facter', '>= 1.7.0'
gem "rspec-puppet-facts"
gem "beaker"
gem "beaker-rspec"
gem "puppet-blacksmith"
gem "metadata-json-lint"

group :development, :test do
    gem 'beaker-rspec', :require => false
end
