module SessionsHelper
  before_action :authenticate_user, only: [:index]
   def current_user
    User.find_by(id: session[:user_id])
  end

  def index
    html+= "<%= "Comment", comment_path %>"
    html+="<%="Like",like_path %>"
    html+= "<%= "Create Gossip", create_path %>"
    html

   def log_in(user)
    session[:user_id] = user.id
  end

  private


  def logged_in?
    if session[:user_id] != nil
      return true
    elsif session[:user_id] == nil
      return false
    end
  end

  private

 
  def authenticate_user
    unless current_user
      flash[:danger] = "please log in."
      redirect_to new_session_path
    end
  end
end
