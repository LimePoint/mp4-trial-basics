action :print_names, description: 'prints names from a file' do                                                          
  exec_command 'cat files/list_of_names.txt'
end
 
action :print_names_without_gui do
  log.info 'I will not been seen in the ui but I can be executed'
  log.info 'I can be executed as a step of another action or just directly via run_change'
end

action :print_all_names, description: 'prints all names', steps: [:print_names, :print_names_without_gui] do                                                          
  exec_command 'cat files/list_of_names.txt'
end

action :child_1 do
    log.info "I am child action 1, I can be called independently"
end
action :child_2 do
    log.info "I am child action 2, I can be called independently"
end

action :print_all_names_parallel, description: 'prints all names in parallel', steps: [:print_names, :print_names_without_gui, :child_1, :child_2], run_as: :parallel do                                                          
  exec_command 'cat files/list_of_names.txt'
end