class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversation, :pm, :string
    add_column :conversation, :pm, :string
  end
end
