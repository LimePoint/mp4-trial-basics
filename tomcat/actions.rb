action :print_memory, description: 'prints memory' do
    log.info "Heap size for current environment: #{OpsChain.properties.tomcat.minimum_memory}"
  end
