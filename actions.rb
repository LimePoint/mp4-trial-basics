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



action :grandchild_1 do
  log.info "I am grand child action 1, I can be called independently. 
  But when called in prereq mode, I'll run before the calling action"
end

action parent_1: [:grandchild_1], steps: [:child_1, :child_2] do
  log.info "I am parent action 1 and will now call child_1 and child_2 one by one."
end

