require 'serverspec'
require 'yarjuf'

RSpec.configure do |c|
  c.output_stream = File.open('serverspec-result.xml', 'w')
  c.formatter = 'JUnit'
end

if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM).nil?
  set :backend, :exec
else
  set :backend, :cmd
  set :os, family: 'windows'
end
