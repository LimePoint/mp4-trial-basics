action :print_memory, description: 'printm_emory' do
  log.info "Memory: #{OpsChain.properties.tomcat.minimum_memory}"
end