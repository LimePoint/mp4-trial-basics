action :print_memory, description: 'prints memory usage from a file' do                                                          
  exec_command 'cat files/memory_usage.txt'
end