action :hello_world do
  puts "Hello world from MintPress"
end
action :run_shell_commands do
  exec_command 'whoami'
end
action :run_shell_commands_2 do
  exec_command 'whoami'
  exec_command 'meminfo'
end
action :run_shell_commands_3 do
  exec_command '/bin/false'
  exec_command 'whoami' # this will not run as the previous command will fail
end
action :run_shell_commands_4 do
  exec_command '/bin/false', abort_on_failure: false
  exec_command 'whoami' # this will run as the previous command result do not matter
end
action :run_shell_commands_5 do
  exec_command '/tmp/non_existent_script.sh'
  puts “I will never get run”
end
action :run_shell_commands_6 do
  result = exec_command 'cat /etc/passwd'
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
     puts "did not find any users."
  end
end
action :run_shell_commands_7 do
  result = exec_command 'cat /etc/passwd', live_stream: false
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
     puts "did not find any users, error was: #{result.stderr}"
  end
end

my_name = 'foo'

action :print_variable_1 do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'

action :print_variable_2 do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

action :print_variable do
  puts "I am the first line"
end


action :print_variable do
  puts "I am the second line"
end