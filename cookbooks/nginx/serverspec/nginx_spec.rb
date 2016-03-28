require 'spec_helper'

describe 'nginx::default' do
  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port('8080') do
    it { should be_listening.with('tcp') }
  end
end
