class AccountController < ApplicationController
  def new
    @identifiant=params[:identifiant]
    puts @identifiant
    puts params
  end
  def show
    @identifiant=params[:identifiant]
    puts @identifiant
    puts params
  end
  def create
    @identifiant=params[:identifiant]
    puts @identifiant
    puts params
    newuser=Identifiant.create!(identifiant: params[:identifiant], password: nil)
# on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  end
  def welcome
  end
  def edit
  end

end
