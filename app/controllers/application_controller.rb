class ApplicationController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  set :views, Proc.new { File.join(root, "views/growls") }
end
