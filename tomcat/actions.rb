action :print_memory do
    log.info "Heap size for current environment: #{OpsChain.properties.memory.minimum_memory}"
  end

  action :print_memory1 do
    log.info "Heap size for current environment: #{OpsChain.properties.tomcat.minimum_memory}"
  end