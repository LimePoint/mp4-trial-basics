
action :tomcat_properties do
  log.info "Tomcat minimum memory: #{tomcat['minimum_memory']}" 
end
