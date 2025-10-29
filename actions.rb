action :run_shell_commands do
  result = exec_command 'cat /etc/passwd'
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
     puts "did not find any users."
  end
end
 