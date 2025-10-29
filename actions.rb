action :hello_world do
  puts "Hello world from MintPress"
end

action 'hello_world_string' do
  puts "Hello world from MintPress"
end
my_name = 'foo'

action :print_variable_1 do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'

action :print_variable_2 do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end
