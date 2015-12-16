get "/sessions/new" do
  erb :"/sessions/new"
end

post "/sessions" do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  elsif !user
    erb :"/sessions/new", locals: {errors: ["username not found"]}
  elsif user.password != params[:password]
    erb :"/sessions/new", locals: {errors: ["password incorrect"]}
  end
end

delete "/sessions" do
  session.clear
  redirect '/'
end
