action :hello_world do
  puts "Hello world from MintPress"
end

action 'hello_world_string' do
  puts "Hello world from MintPress"
end

action :find_errors do
  puts "I am missing an s in the puts and will error out"
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

action :print_cpus do                                                                                                                             
  output = exec_command "bash scripts/get_cpu.sh", live_stream: false
  cpu = output.stdout
  log.info "output from get_cpu - #{cpu}"
  result = exec_command "bash scripts/print_cpu.sh #{cpu}", live_stream: false
  log.info result.stdout
end
