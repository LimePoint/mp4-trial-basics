action :cpu_scripts do                                 
  exec_command 'chmod +x ./scripts/get_cpu.sh'
  exec_command 'chmod +x ./scripts/print_cpu.sh'
  result1 = exec_command './scripts/get_cpu.sh'
  exec_command "./scripts/print_cpu.sh #{result1}"
end 