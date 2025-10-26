action :print_names, description: 'prints names from a file' do
  exec_command 'cat ../files/list_of_names.txt'
end
