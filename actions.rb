
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

my_value = 'set_from_outside_action'

# simple scripts
action :run_script do
  sh 'sh scripts/hello.sh'
end

# Using logging - this will run before any actions (think of this as code in the recipe)
OpsChain.logger.info("----------- logger info --------- ")

my_value = 'set_from_outside_action'

OpsChain.logger.info ("Value of my_value = #{my_value}")

# we can write any ruby code here, it will just execute coz mint will just run the full file and ignore anything under the actions block unless the 
# action is called
#
action :run_any_ruby do
  f = 'scripts/hello.sh'
  content = File.read(f)
  puts "value of content from file #{f} is: \n #{content}"
  OpsChain.logger.info("You can output log via logger too - #{content}")
end

# working with output of commands

# result.status, result.stdout, result.stderr, 
action :run_shell_with_output do
  result = exec_command 'whoami'
  OpsChain.logger.info "value of result: #{result}"
  OpsChain.logger.info "did the command succeed: #{result.status}"
end

