class Mygossip < ActiveRecord::Migration[5.2]
  def change
    create_table :mygossips do |t|
      t.integer :monpotin
    end
  end
end
