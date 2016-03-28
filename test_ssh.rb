require 'chef/provisioning/ssh_driver'

with_driver 'ssh'

machine "test" do
#  action [:ready, :setup, :converge]
  machine_options :transport_options => {
    'ip_address' => '192.168.2.10',
    'username' => 'vagrant',
    'ssh_options' => {
    'password' => 'vagrant'
    }
  }
  converge true
end
