#action :hello_world do
#  puts "Hello world from MintPress"
#end
#
#action :hello_world do
#  puts "Hello world from MintPress"
#end

#action 'hello_world_string' do
#  puts "Hello world from MintPress"
#end

#action :run_shell_commands do
#  exec_command 'whoami'
#end
#
#action :run_shell_commands do
#  exec_command 'whoami'
#  exec_command 'meminfo'
#end

#action :run_shell_commands do
#  exec_command '/bin/false'
#  exec_command 'whoami' # this will not run as the previous command will fail
#end
#
action :run_shell_commands do
  exec_command '/bin/false', abort_on_failure: false
  exec_command 'whoami' # this will run as the previous command result do not matter
end
