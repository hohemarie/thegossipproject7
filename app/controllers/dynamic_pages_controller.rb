class DynamicPagesController < ApplicationController
  def index
    # @potin = Gossip.new
    @display = Gossip.all
    # puts @display["title"]
  end

  def welcome
    @first_name = params[:first_name]
  end

  def potin
    @id = params[:id_potin]
  end
end
