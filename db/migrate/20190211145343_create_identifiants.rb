class CreateIdentifiants < ActiveRecord::Migration[5.2]
  def change
    create_table :identifiants do |t|

      t.timestamps
    end
  end
end
