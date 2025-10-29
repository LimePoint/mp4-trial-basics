action :grandchild_1 do
  log.info "I am grand child action 1, I can be called independently. 
  But when called in prereq mode, I'll run before the calling action"
end

action parent_1: [:grandchild_1], steps: [:child_1, :child_2] do
  log.info "I am parent action 1 and will now call child_1 and child_2 one by one."
end
:wq! 
