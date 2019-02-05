class GamesController < ApplicationController
  before_action :set_game, only: %i[show update]
  
  def index
    games = Game.all
    render json: games
  end


  def create
    game = Game.create("state" => params[:state])
    render json: game, status: 201
  end

  def show
    render json: @game
  end

  def update
    @game.state = params[:state]
    @game.save
    render json: @game
  end

 private

  def set_game
    @game = Game.find(params[:id])
  end

end
