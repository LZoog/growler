class GrowlsController < ApplicationController
  set :views, Proc.new { File.join(root, "views/growls") }

get '/' do

  @growls = Growl.all

  erb :index
end

post '/' do

  @growl = Growl.new(params["growl"])
  @growl.save

redirect '/'
end

end
