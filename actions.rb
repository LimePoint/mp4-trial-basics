action :print_cpus do
  output = exec_command "bash scripts/get_cpu.sh", live_stream: false
  cpu = output.stdout
  log.info "output from get_cpu - #{cpu}"
  result = exec_command "bash scripts/print_cpu.sh #{cpu}", live_stream: false
  log.info result.stdout
end


action :print_hostname do
  exec_command "cat /etc/hostname"
end

my_name = 'foo'
#my_address = 'foo'

action :print_variable do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'

action :print_variable_1 do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'newbar'

action :print_variable_3 do
  my_address = 'reset'
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

action :print_var do
  #my_var = 'foo'
  puts "my name is print_var"
end

action :print_var do
  puts "my name is print_var override"
  #puts "my var is #{my_var}"
end

action :find_errors do
  put "I am missing an s and will error out"
end

action :use_logging do
  puts "Current log level - #{log.level}"
  log.level = ::Logger::ERROR
  puts "new log level - #{log.level}"
  puts "I am being printed via puts"
  log.info "I am being printed via the logger as info"
  log.warn "I am being printed via the logger as warn"
  log.error "I am being printed via the logger as error"
  log.debug "I am being printed via the logger as debug"
  log.fatal "I am being printed via the logger as fatal"
end





#
#
#
#my_name = 'foo'
#
#action :print_variable_1 do
#  puts "--------- Value of variable my_name: #{my_name}"
#  puts "--------- Value of variable my_address: #{my_address}"
#end
#
#my_address = 'bar'
#
#action :print_variable_2 do
#  puts "--------- Value of variable my_name: #{my_name}"
#  puts "--------- Value of variable my_address: #{my_address}"
#end
#



action :run_multi_shell_commands do
  exec_command '/tmp/script.sh' #, abort_on_failure: false
  puts "I will never get printed"
  exec_command 'whoami' # this will not run
end

action :run_shell_commands_output do
  result = exec_command 'cat /etc/passwd', live_stream: false
  if result.success?
     puts "found the list of users: #{result.stdout}"
  else
    puts "did not find any users, error was: #{result.stderr}"
  end
end

#action :run_shell_commands_output do
#  result = exec_command 'cat /etc/passwd1', abort_on_failure: false
#  if result.success?
#     puts "found the list of users: #{result.stdout}"
#  else
#    puts "did not find any users, error was: #{result.stderr}"
#  end
#end



action :print_users do
  exec_command 'cat /etc/passwd'
end

action :find_user do
  user_name = 'root'
  result = exec_command "cat /etc/passwd |grep #{user_name}"
  OpsChain.logger.info "found user - #{result.stdout}"
end

new_value='new value'
# simple shell commands
action :run_shell_commands do
  sh 'echo default shell: ${SHELL}'
  sh "echo this will use bash echo command to print this line"
  sh "echo this will use bash echo command to print this second line"
  sh "echo 'this will print list of users'; cat /etc/passwd"
  sh 'MY_VAR=test; echo value of my_var in the same sh: ${MY_VAR}'
  sh 'echo value of my_var in the subsequent sh: ${MY_VAR}' # variables from previous cannot be used in subsequent calls, each is run in its own shell
 # sh "echo value of my_value: #{my_value}" # this will not work as my_value is defined after this action block
  sh "echo value of new_value: #{new_value}" # this will work as new_value is defined before action block
end

my_ip_addr = nil

action :calculate_ip do
  my_ip_addr = "10.0.0.1"
end

action bringup_ip: [:calculate_ip] do # prereq style
  puts "puts id : #{my_ip_addr}"
end


my_value = 'set_from_outside_action'

# simple scripts
action :run_script do
  sh 'sh scripts/hello.sh'
end

# Using logging - this will run before any actions (think of this as code in the recipe)

my_value = 'set_from_outside_action'


# we can write any ruby code here, it will just execute coz mint will just run the full file and ignore anything under the actions block unless the 
# action is called
#
action :run_any_ruby do
  f = 'files/list_of_names.txt'
  content = File.read(f)
  log.info "Content of files - #{content}"
end

# working with output of commands

# result.status, result.stdout, result.stderr, 
action :run_shell_with_output do
  result = exec_command 'whoami'
  OpsChain.logger.info "value of result: #{result.stdout}"
  OpsChain.logger.info "value of result error: #{result.stderr}"
  OpsChain.logger.info "did the command succeed: #{result.success?}" # result.failed?

  # You can use the output of commands to do anything in Ruby
  if result == 'oracle'
    OpsChain.logger.info 'user is oracle, will do something'
  else
    OpsChain.logger.info 'user is not oracle, will do something else'
  end

  # you can pass env variables
  r = exec_command 'echo $SOME_VAL', {'SOME_VAL' => 'ABC'}  # the second param is a map of variables
end


action 'string_action' do
  OpsChain.logger.info "this is a string action"
end
action :symbol_action do
  OpsChain.logger.info "this is a symbol action"
end

# action chaining
#
action :grandchild_1 do
  OpsChain.logger.info "I am grand child action 1"
end

action :child_1 do
  OpsChain.logger.info "I am child action 1"
end

action :child_2 do
  OpsChain.logger.info "I am child action 2"
end

action parent_1: [:grandchild_1], steps: [:child_1, :child_2] do
  OpsChain.logger.info "I am parent action 1 and will now call child_1 and child_2 one by one"
end

action :parent_2, steps: [:child_1, :child_2], run_as: :parallel do
  OpsChain.logger.info "I am parent action 2 and will now call child_1 and child_2 in parallel"
end

# complex chaining
action :grandparent_1, steps: [:parent_1, :parent_2] do
  OpsChain.logger.info "I am grand parent 1"
end

# separating actions in diff files
require_relative './some_other_file.rb'


# this will fail without docker

# install your tools via Dockerfile

action :wait_step, steps: [OpsChain.wait_step, :post_wait] do
  OpsChain.logger.info "This step is going to wait to be manually continuing before running post_wait action"
end

action :post_wait do
  OpsChain.logger.info "this will run after a wait step"
end

action :post_wait_again do
  OpsChain.logger.info "this will run after a wait step"
end

action :multiple_wait_steps, steps: [OpsChain.wait_step, :post_wait, OpsChain.wait_step, :post_wait_again] do
  OpsChain.logger.info "this is multiple wait steps"
end

action :run_me_first do
  OpsChain.logger.info "I am running first ..."
end

# runs run_me_first, :wait_step before it runs step prereqs, then runs multiple_wait_steps
action prereqs: [:run_me_first, :wait_step], steps: [:multiple_wait_steps] do
  OpsChain.logger.info "I will run after run_me_first and wait_step and then multiple_wait_steps will run"
end

action :run_python do
  exec_command 'python scripts/sample.py'
end

action :pod_step_read do
  log.info "Trying to read file /tmp/file1.txt create in write step"
  log.info File.read('/tmp/file1.txt')
end

action :pod_step_write, steps: [:pod_step_read] do
  File.write('/tmp/file1.txt', "something")
  exec_command "ls -lrth /tmp"
end

