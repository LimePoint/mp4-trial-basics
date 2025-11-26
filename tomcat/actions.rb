action :print_memory, description: 'print memory' do
  log.info "Memory:
      #{OpsChain.properties.tomcat.minimum_memory}"
 end
