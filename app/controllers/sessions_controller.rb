class SessionsController < ApplicationController
  include SessionsHelper
  before_action :logged_in?, only: [:create]
  before_action :logged_in?, only: [:like]
  before_action :logged_in?, only: [:comment]
  before_action :logged_in?, only: [:show]
  before_action :logged_in?, only: [:edit]
  def index
  end
  def destroy
    session.delete(:user_id)
  end
  def create
    potin = Gossip.create(id_potin: @id_potin, content: @content, user_id: @user_id)
  end
end
