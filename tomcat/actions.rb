action :print_memory, description: 'print_memory' do
log.info "Printing memory info: #{OpsChain.properties.tomcat.minimum_memory}"
end