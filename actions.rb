action :print_cpus do                                                                                                                             
  output = exec_command "./scripts/get_cpu.sh", live_stream: false
  cpu = output.stdout
  log.info "output from get_cpu - #{cpu}"
  result = exec_command "./scripts/print_cpu.sh #{cpu}", live_stream: false
  log.info result.stdout
end 