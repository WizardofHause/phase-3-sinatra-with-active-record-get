class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  # retrieve ALL games...
  # get '/games_all' do
  #   games = Game.all
  #   games.to_json
  # end

  # sort games by TITLE...
  # get '/games_title' do
  #   games = Game.all.order(:title)
  #   games.to_json
  # end

  # same as above, but return ONLY the first 10 games...
  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  get '/games/:id' do
    games = Game.find(params[:id])
    games.to_json(include: { reviews: { include: :user } })
  end
                       
end
