action :print_names, description: 'prints names from a file' do                                                          
  exec_command 'cat files/list_of_names.txt'
end
 
action :print_names_without_gui do
  log.info 'I will not been seen in the ui but I can be executed'
  log.info 'I can be executed as a step of another action or just directly via run_change'
end

action :print_all_names, description: 'prints all names', steps: [print_names, print_names_without_gui]
