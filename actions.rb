action :parent_1, steps: [:child_1, :child_2] do
    log.info "I am parent action 1 and will now call child_1 and child_2 one by one"
  end