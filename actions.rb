action :hello_world do
  puts "Hello world from MintPress"
end

action :run_shell_commands do
 exec_command 'whoami'
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
 puts "I will never get run"
end

action :run_shell_commands_5_1 ,ignore_failure: true do
 exec_command '/tmp/non_existent_script.sh'
 puts "I will never get run"
end

action :run_shell_commands_6 do
  result = exec_command 'cat /etc/passwd'
  if result.success?
    puts "found the list of users: #{result.stdout}"
  else
    puts "did not find any users."
  end
end


action :run_shell_commands_7 do
  result = exec_command 'cat /etc/passwd', live_stream: false
  if result.success?
    puts "found the list of users: #{result.stdout}"
  else
   puts "did not find any users, error was: #{result.stderr}"
  end
end


action :list_users do
  exec_command 'cat /etc/passwd'
end

action :delete_user do
  exec_command 'userdel oracle'
end

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
  put "I am missing an s in the puts and will error out"
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
  output = exec_command "bash get_cpu.sh", live_stream: false
  cpu = output.stdout
  log.info "output from get_cpu - #{cpu}"
  result = exec_command "bash print_cpu.sh #{cpu}", live_stream: false
  log.info result.stdout
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

action :grandchild_1 do
  log.info "I am grand child action 1, I can be called independently. 
  But when called in prereq mode, I'll run before the calling action"
end

action parent_3: [:grandchild_1], steps: [:child_1, :child_2] do
  log.info "I am parent action 1 and will now call child_1 and child_2 one by one."
end


action :wait_step, steps: [OpsChain.wait_step, :post_wait] do
  log.info "This step is going to wait to be manually continuing before running post_wait action"
end    
       
action :post_wait do
 log.info "I will run after the wait step"
end    

action :post_wait_again do
 log.info "I will also run after a wait step"
end    

       
action :multiple_wait_steps, steps: [OpsChain.wait_step, :post_wait, OpsChain.wait_step, :post_wait_again] do
 log.info "this is multiple wait steps"
end    

action :wait_step_with_timer, steps: [OpsChain.wait_step(seconds: 90), :post_wait] do
  log.info "I will wait 90 seconds before I run post_wait"
end

action :wait_step_with_name, steps: [OpsChain.wait_step(step_name: 'Wait for network team'), :post_wait] do
  log.info "I have a name"
end

action :run_python do
  exec_command 'python sample.py'
end

action :pod_step_read do
  log.info "Trying to read file /tmp/file1.txt create in write step"
  log.info File.read('/tmp/file1.txt')                                                                                                            
end        
           
action :pod_step_write, steps: [:pod_step_read] do
  File.write('/tmp/file1.txt', "something")
  exec_command "ls -lrth /tmp"
end     
 
 