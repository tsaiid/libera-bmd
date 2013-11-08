class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :UNIQUE_ID, :null => false
      t.float :X_VALUE, :null => false
      t.float :Y_VALUE
      t.float :STD
      t.float :L_VALUE
      t.timestamps
    end
  end
end
