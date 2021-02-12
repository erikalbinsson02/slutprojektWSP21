require"sinatra"
require"slim"
require"sqlite3"
enable :sessions
require_relative "./model.rb"

get("/") do 
    slim(:index)
end