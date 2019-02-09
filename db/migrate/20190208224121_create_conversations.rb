class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.string :role
      t.string :replique
      t.integer :user_id
      t.string :name
    end
  end
end
