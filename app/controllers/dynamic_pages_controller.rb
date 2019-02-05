class DynamicPagesController < ApplicationController
  def index
  end

  def welcome
    @first_name = params[:first_name]
  end

  def potin
    @id_potin = params[:id_potin]
  end
  
  def user
    @user_id = params[:user_id]
  end
end
