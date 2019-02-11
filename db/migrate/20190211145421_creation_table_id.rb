class CreationTableId < ActiveRecord::Migration[5.2]
  def change
      add_column :identifiants, :login, :string
      add_column :identifiants, :password, :string
  end
end
