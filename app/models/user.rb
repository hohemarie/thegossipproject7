class User < ApplicationRecord
  belongs_to :city, optional: true # on fait le lien entre l'user et sa ville
  has_many :gossips # on dit qu'un user peut cree des gossip
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage" # on fait un lien entre l'utilisateur et les messages qu'il envoi
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage" # on fait le lien entre l'user et les messages qu'il recoi
# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
end
