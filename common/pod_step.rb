action :pod_step_read do
log.info "Trying to read file /tmp/file1.txt create in write step"
log.info File.read('/tmp/file1.txt')
end
action :pod_step_write, steps: [:pod_step_read] do
File.write('/tmp/file1.txt', "something")
exec_command "ls -lrth /tmp"
end
