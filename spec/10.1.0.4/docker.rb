require 'spec_helper'

describe 'docker::default' do
  describe package('docker-engine') do
    it { should be_installed }
  end
  describe service('docker') do
    it { should be_enabled }
    it { should be_running }
  end
  describe port('2375') do
    it { should be_listening.with('tcp') }
  end
end
