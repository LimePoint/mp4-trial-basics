require 'opschain'
#minimum_memory = 128 # Set this to the desired minimum memory value

action :print_memory, description: 'prints memory usage from a file' do
  OpsChain.repository_properties_for(:environment)
  minimum_memory = OpsChain.properties.tomcat.minimum_memory                                                         
  puts "--------- Value of variable minimum_memory: #{minimum_memory}"
end