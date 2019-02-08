Rails.application.routes.draw do
  # Contient les routes du programme

  #Les pages statiques de mon programme

  get '/', to: 'dynamic_pages#index' # renvoi vers le model index
  get '/team', to: 'static_pages#team' # renvoi vers le model index
  get '/contact', to: 'static_pages#contact' # renvoi vers le model index

  #Les pages dynamiques du dossier Ruby

  get 'potin/:id_potin', to: 'sessions#show' # renvoi vers le model potin
#/!\ on ne montre pas le potin si lutilisateur nest pas connecte
  post 'potin/:id_potin', to: 'sessions#comment' #quand le commentaire est poste il doit etre associe a l'utilisateur concerne - dans notre programme lutilisateur actuel est appele : current_user

#on verifie quil est bien connecte avec la methode logged_in?
  get 'user/:user_id', to: 'dynamic_pages#user' # renvoi vers le model user

#method get
#le programme prend la variable aussi appelee parametre dans lurl
#ensuite tout se fait dans le controller et la view
#dans le controller on va chercher dans les DB de notre dossier ruby
#dans notre view on affiche #en effet, dans le cas dune methode get la view nous sert a afficher des choses le controller nous sert a aller chercher des choses dans les bases de donnees
#dans le fichier controller de mon fichier ruby je dois recuperer le valeur de la variable user_id et je dois aussi recuperer toutes les donnees de lutilisateur
#a linterieur de ce dossier ruby je dois par la suite recuperer toutes les donnees relatives a cet utilisateur et les afficher comme demande sous la forme dune fiche donnant les informations de l'utilisateur
#ces methodes doivent permettent un allegement de lecriture du code dans la view, un code de la view plus light ~~~~~
  get 'edit/:id_potin', to: 'sessions#edit' # renvoi vers le model potin
#a linterieur de cette methode get je me suis saisie du numero de lid du potin dans la fiche du potin alors que jetais connectee. 
#dans cette page jai affiche le contenu du potin et jai commence a ecrire ma rectification du potin 

#sur quelle page suis je ? Normalement, je suis sur le page du potin, mais ce n'est pas clair si je suis sur la page du potin ou non.
  post 'edit/:id_potin', to: 'sessions#edit' 

#je renvoi grace au formulaire un nouveau contenu du formulaire qui est a remplacer parlancien.
#je peux supprimer lancien potin et rajouter un potin a la place de celui ci
#/!\ je ne peux pas editer le potin si jesuis lauteur du potin
  get 'destroy/:id_potin', to: 'dynamic_pages#destroy' #renvoi vers le potin
#un nom de variable ou aucun nom de variable dans le nom de la route
#ici, un nom de variable.
#dans le fichier controller on recupere le contenu de cette variable a linterieur de ce que l'on appelle un parametre.
#verifions que la methode du fichier controller recupere bien le contenu de ce parametre.
#je ne peux pas detruire le potin si je nesuis pas lauteur du potin
   
  get 'like/:id_potin/:user_id', to: 'dynamic_pages#like'#renvoi vers la methode et le model like
  get 'welcome/:first_name', to: 'dynamic_pages#welcome' #on demande a lutilisateur un email et un mot de passe 
#on recupere le first_name dans la barre de lurl - le first_name est dans notre app ruby un parametre (param) -- le fichier controller peut mettre le contenu de ce parametre dans une variable reutilisable dans les views ou dans les controllers
#changerle controller
#dans le ocntroller de dynamic pages la foncion welcome doit recuperer le contenu du parametre first name car nous avons une methode get
  post 'welcome', to: 'sessions#signin' 

# la methode POST ne recupere pas lavaleur des parametres de la meme facon puisquil que la methode utilise des formulaires

#dans le controller du fichier sessions je dois avoir les parametres recuperes par la methode POST ilsincluent deux choses le prenom de  dutilisateur email et mot de passe

#ceux ci peuvent alors etre mis dans le fichier controller
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
#lutilisateur est connecte 
  get 'session-dutilisateur/:user_id', to: 'sessions#user' #l'utilisateur est connecte#on a son id et on lui propose un eventail de choix des actions qu'il veut effectuer avec sa session d'utilisateur le logout fait partie de ces choix
  get 'logout', to: 'dynamic_pages#welcome'

  post 'nouveau-potin/:user_id', to: 'dynamic_pages#create' #/!\ L'utilisateur ne peut pas creer de potin si l'utilisateur nest pas connecte

#on cree un nouveau potin sur une nouvelle page
  
     
end
