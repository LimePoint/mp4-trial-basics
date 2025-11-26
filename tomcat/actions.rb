action :print_memory, description: 'prints resolved heap size' do
    log.info "Environment: #{env.name}"
    log.info "Heap size: #{heap_size}"
  end