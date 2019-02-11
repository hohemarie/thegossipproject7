class EssayeController < ApplicationController
  def show
    @gossips = Gossip.all
  end
  def index
    @gossips = Gossip.all
  end
  def welcome
  end

end
