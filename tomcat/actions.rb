action :print_memory, description: 'prints memory from a file' do
log.info "Memory:
      #{OpsChain.properties.tomcat.minimum_memory}"
end

