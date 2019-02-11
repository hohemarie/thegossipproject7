class SigninController < ApplicationController
  def create
  end
  def new
    @identifiant = params[:identifiant]
    puts @identifiant    
  end
  def show
  end
end
