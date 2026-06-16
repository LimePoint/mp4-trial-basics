action :print_memory do                                     
  log.info "Heap size for the environment: #{OpsChain.properties.tomcat.minimum_memory}" 
end