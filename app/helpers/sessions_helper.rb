module SessionsHelper
  #before_action :authenticate_user, only: [:index]
  def current_user
    User.find_by(id: session[:user_id])
  end

    # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def index
    #html+= "<%= "Comment", comment_path %>"
    #html+="<%#"Like",like_path %>"
    #html+= "<%= "Create Gossip", create_path %>"
    #html
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

#logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "please log in."
      redirect_to new_session_path
    end
  end
end
