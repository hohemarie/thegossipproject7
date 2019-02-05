class DynamicPagesController < ApplicationController
  # Method pour ma page index
  def index
  end
  # Method pour ma page welcome
  def welcome
    @first_name = params[:first_name]
  end
  # Method pour ma page potin
  def potin
    @id_potin = params[:id_potin]
  end
  # Method pour ma page user
  def user
    @user_id = params[:user_id]
  end
end
