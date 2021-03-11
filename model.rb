
post("/login") do
    username = params[:username]
    password = params[:password]
    db = SQLite3::Database.new("db/forum_projekt.db")
    db.results_as_hash = true
    result = db.execute("SELECT * FROM users WHERE username = ?",username).first
    pwdigest = result["pwdigest"]
    id = result["id"]
    
    if BCrypt::Password.new(pwdigest) == password
      session[:id] = id
      redirect("/layout")
    end
end

#post("/register") do
def register_user()
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
  
    if (password == password_confirm)
      
      password_digest = BCrypt::Password.create(password)
      db = SQLite3::Database.new("db/forum_projekt.db")
      db.execute("INSERT INTO users(username,pwdigest) VALUES (?,?)",username,password_digest)
      redirect("/")
    else
      "Lösenorden matchade inte"
    end
end
  #end