# Simple exec
#
 action :run_shell_commands do
  sh 'MY_VAR=foo; echo value of my_var in the same sh: $MY_VAR'
  sh 'echo value of my_var in the subsequent sh: $MY_VAR'
  sh 'echo default shell: ${SHELL}'
  sh "echo this will use bash echo command to print this line"
  sh "echo this will use bash echo command to print this second line"
  sh "echo 'this will print list of users'; cat /etc/passwd"
end


