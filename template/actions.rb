action :print_memory, description: "Print the memory" do                                     
    log.info "Memory: #{OpsChain.properties.tomcat.minimum_memory}"  
end