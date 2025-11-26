action :print_memory do
  log.info "Meory: #{OpsChain.properties.tomcat.minimum_memory}"
end