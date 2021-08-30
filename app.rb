require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get "/" do
  @count = Count.count
  erb :index
end

get "/plus" do
  Count.count = Count.count + 1
  
  redirect "/"
end

get "/minus" do
  Count.count = Count.count - 1
  redirect "/"
end