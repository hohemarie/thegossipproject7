class EssayeController < ApplicationController
  def show
  end
  def index
    @gossips = Gossip.all
  end
  def welcome
  end

end
