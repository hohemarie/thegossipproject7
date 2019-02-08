class SessionsController < ApplicationController
  before_action :exist, only: [:signin]
  before_action :signed_in?, only: [:show]


  def signed_in?

  end
  def show
    @id_potin = params[:id_potin]
    @content = Gossip.find(@id_potin).content
    puts @content
  end
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
  def edit
    @id_potin = params[:id_potin]
    @potin = Gossip.find(@id_potin)
    @title = Gossip.find(@id_potin).title
    @replace_content = params[:replace_content]
    @created_at = "date-du-jour"
    @user_id = Gossip.find(@id_potin).id
  end
  def comment
    @comment = params[:new_comment]
    @id_potin = params[:id_potin]
    @potin = Gossip.find(@id_potin) 
    commentaire = Comment.create!(user_id: @user_id, content: @comment, id_potin: @id_potin, created_at: "date ", city_id: @city_id)
  end
end
