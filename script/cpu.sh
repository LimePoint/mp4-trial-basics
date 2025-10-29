action :print_cpus do                                                                                                                             
  output = exec_command "bash script/get_cpu.sh", live_stream: false
  cpu = output.stdout
  log.info "output from get_cpu - #{cpu}"
  result = exec_command "bash script/print_cpu.sh #{cpu}", live_stream: false
  log.info result.stdout
end 
 