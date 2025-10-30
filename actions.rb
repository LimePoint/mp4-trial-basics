action :run_shell_commands do
    exec_command 'whoami'
  end

  action :run_shell_commands_2 do
    exec_command 'whoami'
    exec_command 'cat /proc/meminfo'
  end
   
   
  action :run_shell_commands_3 do
    exec_command '/bin/false'
    exec_command 'whoami' # this will not run as the previous command will fail
  end
   
  action :run_shell_commands_4 do
    exec_command '/bin/false', abort_on_failure: false
    exec_command 'whoami' # this will run as the previous command result do not matter
  end