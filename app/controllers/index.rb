get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  
  if user
    session[:user] = user.id
  end
  
	redirect to("/")
  # sign-in
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(name: params[:name], email: params[:email], password_hash: params[:password])
  session[:user] = user.id
  redirect to("/")
end
