action :kv_properties do                                     
  log.info "Total number of employees: #{OpsChain.properties.to_yaml}"
end

action :kv_properties do
  log.info "First employee: #{OpsChain.properties.organization.employees[0].name}"
end

action :file_properties do
  log.info "Contents of file at /tmp/file1.txt - #{File.read('/tmp/file1.txt')}"
end

action :file_properties do
  exec_command "cat /tmp/file1.txt"
end

action :env_properties do
  log.info "Value of MY_VARIABLE: #{ENV['MY_VARIABLE']}"
  log.info "Value of ANOTHER_VARIABLE: #{ENV['ANOTHER_VARIABLE']}"
end
