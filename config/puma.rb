# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
workers Integer(ENV.fetch("WEB_CONCURRENCY", 3))
threads_count = Integer(ENV.fetch("MAX_THREADS", 5))
threads(threads_count, threads_count)

preload_app!

rackup DefaultRackup
environment ENV.fetch("RACK_ENV", "development")

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
