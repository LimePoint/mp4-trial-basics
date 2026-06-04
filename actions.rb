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
 puts "I will never get run"
end

action :run_shell_commands_5_1 ,ignore_failure: true do
 exec_command '/tmp/non_existent_script.sh'
 puts "I will never get run"
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

action :list_users do
  exec_command 'cat /etc/passwd'
end

action :delete_user do
  exec_command 'userdel oracle'
end

my_name = 'foo'
my_address = 'foo'

action :print_variable do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'
action :print_variable_3 do
  my_address = 'reset'
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end


action :find_errors do
  put "I am missing an s in the puts and will error out"
end

action :use_logging do
  puts "Current log level - #{log.level}"
  puts "I am being printed via puts"
  log.info "I am being printed via the logger as info"
  log.warn "I am being printed via the logger as warn"
  log.error "I am being printed via the logger as error"
  log.fatal "I am being printed via the logger as fatal"
  log.debug "I am being printed via the logger as debug"
end

action :print_cpu do
  cpu_count = exec_command 'sh scripts/get_cpu.sh', live_stream: false
  output = cpu_count.stdout
  log.info "Number of CPI = #{output}"

  print_cpu = exec_command 'sh scripts/print_cpu.sh #{output}', live_stream: false
  puts "Number of CPU is: #{output}"
  log.info "Number of CPI = #{output}"
end
