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
    @id_potin = params[:id_potin]
  end
  
  def user
    @user_id = params[:user_id]
    @description = params[:description]
    @email = params[:email]
  end
end
