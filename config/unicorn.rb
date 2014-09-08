# The rule of thumb is to use 1 worker per processor core available,
# however since we'll be hosting many apps on this server,
# we need to take a less aggressive approach
worker_processes 4

# We deploy with capistrano, so "current" links to root dir of current release
working_directory "/home/deployer/todorails/current"

# Listen on unix socket
listen "/tmp/unicorn.todorails.sock", :backlog => 64

pid "/home/deployer/todorails/current/tmp/pids/unicorn.pid"

stderr_path "/home/deployer/todorails/current/log/unicorn.log"
stdout_path "/home/deployer/todorails/current/log/unicorn.log"
