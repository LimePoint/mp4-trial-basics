action :cpu_scripts do                                 
  result1 = exec_command './scripts/get_cpu.sh'
  exec_command "./scripts/print_cpu.sh #{result1.stdout.strip}"
end 