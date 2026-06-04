action :run_shell_commands_3 do
 exec_command '/bin/false'
 exec_command 'whoami' # this will not run as the previous command will fail
end