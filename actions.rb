action :hello_world do
  puts "Hello world from MintPress"
end

action 'hello_world_string' do
  puts "Hello world from MintPress"
end
action :run_shell_commands do
  result = exec_command 'cat /etc/passw', live_stream: false
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
     puts "did not find any users, error was: #{result.stderr}"
  end
end
