class SessionsController < ApplicationController
  include SessionsHelper
  before_action :logged_in?, only: [:create]
  before_action :logged_in?, only: [:like]
  before_action :logged_in?, only: [:comment]
  before_action :logged_in?, only: [:show]
  before_action :logged_in?, only: [:edit]
  before_action :logged_in?, only: [:destroy]
  def index
    
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def create
    #potin = Gossip.create(id_potin: @id_potin, content: @content, user_id: @user_id)
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


end
