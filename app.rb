require"sinatra"
require"slim"
require"sqlite3"
enable :sessions
require_relative "./model.rb"

get("/") do
    slim(:login)
end

get("/index") do 
    slim(:index)
end

get("/register") do 
    slim(:register)
end

post("/register") do
    register_user(username,password,password_confirm)
end
