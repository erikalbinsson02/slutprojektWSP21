require"sinatra"
require"slim"
require"sqlite3"
enable :sessions
require_relative"./model.rb"
require"byebug"
require"bcrypt"

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
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
    if register_user(username,password,password_confirm) == true
        redirect("/")
    else
        "lösenord matcha inte"
    end
end

post("/login") do
    username = params[:username]
    password = params[:password]
    if login_user(username, password) == true
        redirect("/index")
    else
        "Fel lösenord"
    end
end

get("/user_profile") do
    user_id = session[:user_id].to_i
    byebug
end