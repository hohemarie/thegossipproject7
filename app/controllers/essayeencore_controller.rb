class EssayeencoreController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    puts params[:id]
    @id_potin = params[:id]
    @contenu_du_potin = Gossip.find(@id_potin).content
    @titre_du_potin = Gossip.find(@id_potin).title
    
  end
  def home 
    puts params[:id]
  end
  def welcome
    puts params[:id]
  end
  def edit
    puts params[:id]
    @id_potin = params[:id]
  end
  def index
    puts params
    @id_potin = params[:id]
  end
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      mon_potin = Mygossip.create!(monpotin: @id_potin)      
      redirect_to new_account_path
    end
  end
end
