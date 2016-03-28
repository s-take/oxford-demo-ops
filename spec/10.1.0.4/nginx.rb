require 'spec_helper'

describe 'nginx::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port('8080') do
    it { should be_listening.with('tcp') }
  end
end
