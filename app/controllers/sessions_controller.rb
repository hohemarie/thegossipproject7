class SessionsController < ApplicationController
  before_action :logged_in?, only: [:create]
  def index
  end

  def create
    potin = Gossip.create(id_potin: @id_potin, content: @content, user_id: @user_id)
  end
end
