helpers do

  def current_user
    session[:user] ? User.find(session[:user]) : false
  end
    # TODO: return the current user if there is a user signed in.
end
