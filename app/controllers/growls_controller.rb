class GrowlsController < ApplicationController
  set :views, Proc.new { File.join(root, "views/growls") }

  get '/' do
    @growls = Growl.all.order("id DESC")
    erb :index
  end

  post '/' do
    @user = User.new
    @user.username = params["username"].strip
    @user.save
    @userhash = User.find_by(username: @user.username).id

    redirect "/growling?user=#{@userhash}"
  end

  get '/growling' do
    @id = params["user"]
    @growls = Growl.all.order("id DESC")
    erb :growling
  end

  post '/growling' do
    @growl = Growl.new(params["growl"])
    @growl.save
    redirect '/growling'
  end

end
