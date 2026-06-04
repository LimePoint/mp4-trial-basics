my_name = 'foo'
my_address = 'foo'

action :print_variable do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'
action :print_variable_3 do
  my_address = 'reset'
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
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



action :cpu do
  cpu = exec_command 'bash scripts/get_cpu_new.sh'

  if cpu.success?
    exec_command 'bash scripts/print_cpu_new.sh'
  else
    puts "Failed to get no. of cpu count"
  end
end

action :child_1 do
 log.info "I am child action 1, I can be called independently"
end

action :child_2 do
 log.info "I am child action 2, I can be called independently"
end

action :parent_1, steps: [:child_1, :child_2] do
 log.info "I am parent action 1 and will now call child_1 and child_2 one by one"
end

action :parent_2, steps: [:child_1, :child_2], run_as: :parallel do
 log.info "I am parent action 1 and will now call child_1 and child_2 in parallel."
end
# complex chaining

action :grandparent_1, steps: [:parent_1, :parent_2] do
 log.info "I am grandparent 1"
end
