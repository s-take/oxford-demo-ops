require 'chef/provisioning/ssh_driver'

with_driver 'ssh'

machine "test-container" do
  machine_options :transport_options => {
    'ip_address' => '10.1.0.6',
    'username' => 'fkadmin',
    'ssh_options' => {
    'password' => 'fkP@ssw0rd'
    }
  }

  recipe 'nginx'
  #recipe 'docker'

  converge true
end
