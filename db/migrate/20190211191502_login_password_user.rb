class LoginPasswordUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :login, :string
      add_column :users, :password, :string
  end
end
