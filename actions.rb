action :get_cpu do
  result = exec_command './get_cpu.sh', live_stream: false
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
     puts "did not find any users, error was: #{result.stderr}"
  end
end