class EssayeencoreController < ApplicationController
  def show
    puts params[:id]
    @id_potin = params[:id]
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
end
