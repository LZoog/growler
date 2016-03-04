class GrowlsController < ApplicationController
  set :views, Proc.new { File.join(root, "views/growls") }

  get '/' do
    @growls = Growl.all.order("id DESC")
    erb :index
  end

  post '/' do
    # @username_array = []
    # for i in 0..1000
    #   if i > User.all.length
    #     break
    #   @username_array.push User.all[i].username
    # end
    @user = User.new
    @user.username = params["username"].strip
    @user.save
    # @userid = User.id

    redirect '/growling'
  end

  get '/growling' do
    @growls = Growl.all.order("id DESC")
    erb :growling
  end

  post '/growling' do
    @growl = Growl.new(params["growl"])
    @growl.save
    redirect '/growling'
  end

end
