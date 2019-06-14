# InSpec test for recipe elasticsearch::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe command('java -version 2>&1') do
  its('stdout') { should match /1\.8\.0/ }
end

# logstash

describe command('/opt/logstash/bin/logstash -t -f /etc/logstash/conf.d') do
  its(:exit_status) { should eq 0 }
end

describe command('/opt/logstash/bin/logstash -t -f /etc/logstash-two/conf.d') do
  its(:exit_status) { should eq 0 }
end

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9200) do
  it { should be_listening }
end
# 
# describe port(9300) do
#   it { should be_listening }
# end





# describe port(5959) do
#   it { should be_listening }
# end
#
# describe 'should be running Logstash main class' do
#   # can't use process() matcher because of two java processes
#   describe command('ps aux | grep -v grep | grep -s logstash/runner.rb') do
#     its(:exit_status) { should eq 0 }
#   end
# end
#
# describe command('/opt/logstash/server/bin/logstash agent -f /opt/logstash/server/etc/conf.d/ -t 2>&1 | grep -s "Configuration OK"') do
#   its(:exit_status) { should eq 0 }
# end
#
# describe 'lumberjack keypairs' do
#   describe file('/opt/logstash/lumberjack.crt') do
#     it { should be_file }
#   end
#   describe file('/opt/logstash/lumberjack.key') do
#     it { should be_file }
#   end
# end
#
# describe file('/opt/logstash/server/log/logstash.log') do
#   it { should be_file }
#   it { should_not contain 'Permission denied' }
# end
