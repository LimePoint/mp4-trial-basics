action :print_memory, description 'Prints Tomcat Memory' do
  log.info "Minimum memory required: #{OpsChain.properties.tomcat.minimum_memory}"
end
