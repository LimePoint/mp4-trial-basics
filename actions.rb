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

action :kv_properties do                                     
  log.info "Total number of employees: #{OpsChain.properties.to_yaml}"
end
 

action :kv_properties do                                     
  log.info "First employee: #{OpsChain.properties.organization.employees[0].name}" 
end
 