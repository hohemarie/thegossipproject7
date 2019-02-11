class AddRememberDigestToIdentifiants < ActiveRecord::Migration[5.2]
  def change
    add_column :identifiants, :remember_digest, :string
  end
end
