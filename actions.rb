action :hello_world do
  puts "Hello world from MintPress"
end

action 'hello_world_string' do
  puts "Hello world from MintPress"
end

my_name = 'foo'
my_address = 'foo'

action :print_variable do
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end

my_address = 'bar'

action :print_variable_3 do
  my_address = 'reset'
  puts "--------- Value of variable my_name: #{my_name}"
  puts "--------- Value of variable my_address: #{my_address}"
end
