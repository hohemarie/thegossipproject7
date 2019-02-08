Rails.application.routes.draw do
  # Contient les routes du programme

  get '/', to: 'dynamic_pages#index' # renvoi vers le model index
  get '/team', to: 'static_pages#team' # renvoi vers le model index
  get '/contact', to: 'static_pages#contact' # renvoi vers le model index
  get 'welcome/:first_name', to: 'dynamic_pages#welcome' # renvoi vers le model welcome
  get 'potin/:id_potin', to: 'dynamic_pages#show' # renvoi vers le model potin
#/!\ on ne montre pas le potin si lutilisateur nest pas connecte
  post 'potin/:id_potin', to: 'dynamic_pages#comment' #quand le commentaire est poste il doit etre associe a l'utilisateur concerne - dans notre programme lutilisateur actuel est appele : current_user

#on verifie quil est bien connecte avec la methode logged_in?
  get 'user/:user_id', to: 'dynamic_pages#user' # renvoi vers le model user
  get 'edit/:id_potin', to: 'dynamic_pages#edit' # renvoi vers le model potin
#/!\ je ne peux pas editer le potin si jesuis lauteur du potin
  get 'destroy/:id_potin', to: 'dynamic_pages#destroy' #renvoi vers le potin
#je ne peux pas detruire le potin si je nesuis pas lauteur du potin
   
  get 'like/:id_potin/:user_id', to: 'dynamic_pages#like'#renvoi vers la methode et le model like
  get 'page-de-connexion', to: 'sessions#page-de-connexion' #on demande a lutilisateur un email et un mot de passe 
  post 'page-de-connexion', to: 'sessions#signin' 
#si le personnge est mal identifiee ne pas sinscrire et rediriger vers la page dinscription
#si le utilisateur ne remplit pas leschmap de linscription le remvoyer vers a page d;accueil
#dans le methode post on doit envoyer les messages suivants
#lutilisateur rentre les mots de passe conformes oui non
#lutilisateur remplit bien les champs de linscription
#le nom dutilisateur utilise existe deja
#trois tests 




#les identifiants mdp ou emails existent deja dans la base de donnee, lutilisateur a fourni ou non les bonnes paires didentifiants 
#dans le fichier controller on fait une method check before pour que avant authentifier si les identifiants ne concordent pas le programme propose une inscription. donc on peut faire une double verif. si les identifiants ne sont pas pareils, faire une inscrition, sinon faire une entree et verifier les identifiants pour se connecter.
#il faut faire une fonction de verification personnalisee pour connexion et pour inscription.
#ne pas se connecter si les identifiants ne sont pas identitiques
#ne pas sinscrire si les champs ne sont pas remplis
 #log_in_user' #on cree des potins une fois connecte sur la page daccueil de la session - si on dispose de luser id on ne demande a lutilisateur que son mot de passe
  
  #pour linstant sur la page daccueil de la sessions tout ce quon fait cest se connecter et envoyer une adresse email et un mot de passe
  get 'session-dutilisateur/:user_id', to: 'sessions#user' #On verifie que l'utilisateur est connecte
  post 'nouveau-potin/:user_id', to: 'dynamic_pages#create' #/!\ L'utilisateur ne peut pas creer de potin si l'utilisateur nest pas connecte

#on cree un nouveau potin sur une nouvelle page
  
     
end
