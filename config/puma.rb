# wsertrf gr   wuma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
#max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
#min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
#threads min_threads_count, max_threads_count

min_threads = ENV.fetch("MIN_THREADS") { 1 }.to_i
max_threads = ENV.fetch("MAX_THREADS") { 6 }.to_i
app_dir     = File.expand_path("../..", __FILE__)
shared_dir  = "#{app_dir}"


threads         min_threads, max_threads
#port            ENV.fetch("PORT") { 3000 }
environment     ENV.fetch("RAILS_ENV") { "production" }
bind            "unix://#{shared_dir}/tmp/sockets/puma.sock"
pidfile         "#{shared_dir}/tmp/pids/puma.pid"
state_path      "#{shared_dir}/tmp/pids/puma.state"
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true
activate_control_app

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
#port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
#environment ENV.fetch("RAILS_ENV") { "production" }

# Specifies the `pidfile` that Puma will use.
#pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked web server processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
