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

action :run_python do
  exec_command 'python scripts/sample.py'
end

action :kv_properties do                                     
  log.info "Total number of employees: #{OpsChain.properties.to_yaml}"
end
 
action :kv_properties1 do                                     
  log.info "First employee: #{OpsChain.properties.organization.employees[0].name}" 
end

action :file_properties do
  exec_command "cat /tmp/file1.txt"
end

action :env_properties do
  log.info "Value of MY_VARIABLE: #{ENV['MY_VARIABLE']}"
  log.info "Value of ANOTHER_VARIABLE: #{ENV['ANOTHER_VARIABLE']}"
end 
 
action :global_properties do                                     
  log.info "App Name: #{OpsChain.properties.global_properties.app_name}"
  log.info "Version: #{OpsChain.properties.global_properties.version}"
  log.info "Default Language: #{OpsChain.properties.global_properties.default_language}"
end