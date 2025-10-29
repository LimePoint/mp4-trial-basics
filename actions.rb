action :run_shell_commands do
  exec_command '/bin/false', abort_on_failure: false
  exec_command 'whoami' # this will run as the previous command result do not matter
end
