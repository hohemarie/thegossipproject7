class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :pm #les messages sont affiches a la suite les uns des autres
  end
end
