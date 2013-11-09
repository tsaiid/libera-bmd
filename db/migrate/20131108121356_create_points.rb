class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :unique_id, :null => false
      t.float :x_value, :null => false
      t.float :y_value
      t.float :std
      t.float :l_value
      t.timestamps
    end
  end
end
