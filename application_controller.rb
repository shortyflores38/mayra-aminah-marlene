require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  
post '/coffee_shop' do
  user_term=params[:location]
  @answer=search("coffee",user_term)
  erb:results
  end
end 