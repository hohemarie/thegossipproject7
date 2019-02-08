class SessionsController < ApplicationController
  before_action :exist, only: [:signin]

  def exist
    @password = params[:password]
    @email = params[:email]
    @first_name = params[:first_name]
    if User.find(@email) != nil
      user = User.find(@email)
      @id_user = user.id
      @first_name = user.first_name
      @last_name = user.last_name
      @city_id = user.city_id
      @email = user.email
      @age = user.age
    end
  end
  def signin
    @password = params[:password]
    @email = params[:email]
    @first_name = params[:first_name]    
    if User.find(@email) != nil
      user_id = User.find(@email).id
    elsif User.find(@email) == nil
      user = User.create!(user_id: "#{User.length+1}", email: @email, first_name: @first_name, password_digest: @password, last_name:Faker::Name.last_name} #on pourrait imaginer une inscription automatique si lutilisateur nest pas inscrit ou si lemail de l'utilisateur est absent de la base de donnees.
    end
  end
end
