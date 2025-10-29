action :get_cpu do
    script_path = File.join(__dir__, 'scripts', 'get_cpu.sh')
    result = exec_command script_path
    if result.success?
         puts "found the list of users: #{result.stdout}"
    else
         puts "did not find any users, error was: #{result.stderr}"
    end
end