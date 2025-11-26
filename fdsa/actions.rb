action :print_memory, description: 'prints memory configuratoin for the assigned env from fdsa' do                                                          
    memory_config =  OpsChain.properties.tomcat.memory
    log.info "memory configuration for env #{OpsChain.context.parents.environment&.code}  is #{memory_config}GB"
end