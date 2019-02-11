module SessionsHelper
  #before_action :authenticate_user, only: [:index]
  def current_user
    #Identifiant.find_by(identifiant: identifiant)
    id = account[:identifiant]
    @user = User.find(id)
  end

    # Remembers a user in a persistent session.
  def remember(user)
    User.remember
    cookies.permanent.signed[:user] = user.id
  end

  def index
    #html+= "<%= "Comment", comment_path %>"
    #html+="<%#"Like",like_path %>"
    #html+= "<%= "Create Gossip", create_path %>"
    #html
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user] = user.id
  end

#logs in the given user
  def log_in(user)
    session[:user] = user.id
  end

  def current_user
    if session[:user]
      @current_user ||= User.find_by(user: session[:user])
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user)
    @current_user = nil
  end
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "please log in."
      redirect_to new_account_path
    end
  end
end
