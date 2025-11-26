
action :tomcat_properties do
  log.info "Tomcat minimum memory: #{node['tomcat']['minimum_memory']}" 
end
