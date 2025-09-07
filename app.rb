require "sinatra"
require "sinatra/reloader"

get("/") do
  # "
  # <h1>Welcome to your Sinatra App!</h1>
  # <p>Define some routes in app.rb</p>
  # "
  erb(:home)
end

get("/rock") do
  "<p>Rock</p>"
end
get("/paper") do
  "<p>Paper</p>"
end
get("/scissors") do
  "<p>scissors</p>"
end
