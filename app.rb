require 'sinatra'
require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $name_01 = Player.new(params[:name_01])
    $name_02 = Player.new(params[:name_02])
    $game = Game.new($name_01, $name_02)
    redirect '/play'
  end

  get '/play' do
    @name_01 = $name_01.name
    @name_02 = $name_02.name
    @health_01 = $name_01.health
    @health_02 = $name_02.health
    erb :play
  end

  get '/attack' do
    @name_01 = $name_01.name
    @name_02 = $name_02.name
    @health_01 = $name_01.health
    @health_02 = $name_02.health
    @health_02 = $game.attack($name_02)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
