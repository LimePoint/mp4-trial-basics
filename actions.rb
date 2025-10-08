
# simple shell commands
action :run_shell_commands do
  sh 'echo default shell: ${SHELL}'
  sh "echo this will use bash echo command to print this line"
  sh "echo this will use bash echo command to print this second line"
  sh "echo 'this will print list of users'; cat /etc/passwd"
  sh 'MY_VAR=test; echo value of my_var in the same sh: ${MY_VAR}'
  sh 'echo value of my_var in the subsequent sh: ${MY_VAR}' # variables from previous cannot be used in subsequent calls, each is run in its own shell
  sh 'echo value of variable my_value from outside of action block: #{my_value}'
end

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

