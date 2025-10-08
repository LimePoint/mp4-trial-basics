# Simple exec
#
 action :hello do
  sh "echo this will use bash echo command to print this line"
  sh "echo this will use bash echo command to print this second line"
end
