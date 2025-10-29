action :run_shell_commands do
    exec_command 'whoami'
    exec_command 'meminfo'
  end