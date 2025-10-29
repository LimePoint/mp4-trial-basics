action :wait_step, steps: [OpsChain.wait_step, :post_wait] do
  log.info "This step is going to wait to be manually continuing before running post_wait action"
end    
       
action :post_wait do
 log.info "I will run after the wait step"
end    

action :post_wait_again do
 log.info "I will also run after a wait step"
end    

       
action :multiple_wait_steps, steps: [OpsChain.wait_step, :post_wait, OpsChain.wait_step, :post_wait_again] do
 log.info "this is multiple wait steps"
end    

action :run_python do
  exec_command 'python scripts/sample.py'
end
