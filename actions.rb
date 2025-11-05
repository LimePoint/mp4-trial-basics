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
  exec
end
