class CreateReferenceCurves < ActiveRecord::Migration
  def change
    create_table :reference_curves do |t|
      t.integer :unique_id
      t.integer :if_current, :null => false
      t.string :ethnic
      t.string :sex
      t.string :reftype
      t.string :bonerange
      t.integer :if_default, :null => false
      t.string :author
      t.datetime :date
      t.integer :hologic, :null => false
      t.string :curve_set
      t.string :source
      t.string :comment
      t.float :y_min
      t.float :y_max
      t.float :x_min
      t.float :x_max
      t.float :age_young
      t.string :x_label
      t.string :y_label
      t.string :method
      t.timestamps
    end
  end
end
