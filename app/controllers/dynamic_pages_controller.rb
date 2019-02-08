class DynamicPagesController < ApplicationController
  # Method pour ma page index
  def index
    @id_potin = params[:id_potin]
    @auteur = User.find(gossip.user_id).first_name
    
  end

  # Method pour ma page welcome
  def welcome
    @first_name = params[:first_name] #recupere le prenom dans le page welcome pour laffcher dans la page home

# nous sommes dans une methode get au niveau du fichier routes -- le parametre est recuere a partir de lurl 

#la variable avec larobase doit etre reutilise telle quelle pour une utilisation ou un affichage eventuel dans une view
  end

  # Method pour ma page potin
  def potin #recupere lip du potindans lurl voir la route method GET
    @id_potin = params[:id_potin]
    @auteur = User.find(gossip.user_id).first_name
  end
  # Method pour ma page user
  def user #recupere luser id dans lurl voir la route correspondante method GET
    @user_id = params[:user_id]
  end
 
  def like 
    like = Like.create!(id_potin: id_potin, user_id: user_id)
  end
end
