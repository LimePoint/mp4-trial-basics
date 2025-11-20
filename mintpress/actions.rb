action :kv_properties do                                     
    log.info "Total number of employees: #{OpsChain.properties.to_yaml}"
  end

  action :kv_properties do                                     
    log.info "First employee: #{OpsChain.properties.organization.employees[0].name}" 
  end