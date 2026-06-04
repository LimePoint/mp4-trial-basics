action :hello_world do
  puts "Hello world from MintPress"
end

action :run_shell_commands do
 exec_command 'whoami'
end
