action :hello_world do
  puts "Hello world from MintPress"
end

action :run_shell_commands do
 exec_command 'whoami'
end

action :run_system_health_commands do
  desc 'Run multiple validation and system health commands'

  # Basic identity check
  exec_command 'echo "===== USER DETAILS ====="'
  exec_command 'whoami'
  exec_command 'id'

  # System info
  exec_command 'echo "===== SYSTEM INFO ====="'
  exec_command '/bin/hostname'
  exec_command 'uname -a'
  exec_command 'uptime'

  # Disk usage
  exec_command 'echo "===== DISK USAGE ====="'
  exec_command 'df -h'

  # Memory usage
  exec_command 'echo "===== MEMORY USAGE ====="'
  exec_command 'free -m'

  # Process check
  exec_command 'echo "===== TOP PROCESSES ====="'
  exec_command 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -10'

  # Network check
  exec_command 'echo "===== NETWORK INFO ====="'
  exec_command 'ip addr show'
  exec_command 'netstat -tulnp | head -20'

  # Application/service validation (adjust as needed)
  exec_command 'echo "===== SERVICE STATUS ====="'
  exec_command 'systemctl status sshd || echo "sshd not found"'

  # File existence check
  exec_command 'echo "===== FILE CHECK ====="'
  exec_command 'ls -ltr /tmp'
  exec_command 'test -f /etc/passwd && echo "passwd file exists" || echo "passwd file missing"'

  # Custom logic / debugging
  exec_command 'echo "===== CUSTOM DEBUG ====="'
  exec_command 'date'
  exec_command 'env | sort | head -20'

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
 puts “I will never get run”
end
