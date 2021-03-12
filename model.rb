
def login_user(username, password)
    db = SQLite3::Database.new("db/forum_projekt.db")
    db.results_as_hash = true
    result = db.execute("SELECT * FROM user WHERE username = ?",username).first
    pwdigest = result["pwdigest"]
    user_id = result["user_id"]
    
    if BCrypt::Password.new(pwdigest) == password
      session[:user_id] = user_id
      return true
    else 
      return false
    end
  end



def register_user(username,password,password_confirm)
    
    if (password == password_confirm)
      
      password_digest = BCrypt::Password.create(password)
      db = SQLite3::Database.new("db/forum_projekt.db")
      db.execute("INSERT INTO user(username,pwdigest) VALUES (?,?)",username,password_digest)
      return true
    else
      return false
    end
end
  