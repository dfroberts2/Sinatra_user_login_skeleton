get "/users/new" do
  erb :"/users/new"
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

post "/users" do
  new_user = User.new(params)
  if new_user.save
    redirect '/'
  else
    erb :"/users/new", locals: {errors: new_user.errors.full_messages}
  end
end
