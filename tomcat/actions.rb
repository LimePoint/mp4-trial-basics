action :print_memory, description: 'prints print_memory' do                                                          
  log.info "Printing memory info: #{OpsChain.properties.tomcat.minimum_memory}"
end