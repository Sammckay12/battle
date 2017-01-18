require 'sinatra'
require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $name_01 = Player.new(params[:name_01])
    $name_02 = Player.new(params[:name_02])
    redirect '/play'
  end

  get '/play' do
    @name_01 = $name_01.name
    @name_02 = $name_02.name
    erb :play
  end

  get '/status' do
    @name_01 = $name_01.name
    @name_02 = $name_02.name
    erb :status
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
