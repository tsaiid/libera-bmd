class CreateReferenceCurves < ActiveRecord::Migration
  def change
    create_table :reference_curves do |t|
      t.integer :UNIQUE_ID
      t.integer :IF_CURRENT, :null => false
      t.string :ETHNIC
      t.string :SEX
      t.string :REFTYPE
      t.string :BONERANGE
      t.integer :IF_DEFAULT, :null => false
      t.string :AUTHOR
      t.datetime :DATE
      t.integer :HOLOGIC, :null => false
      t.string :CURVE_SET
      t.string :SOURCE
      t.string :COMMENT
      t.float :Y_MIN
      t.float :Y_MAX
      t.float :X_MIN
      t.float :X_MAX
      t.float :AGE_YOUNG
      t.string :X_LABEL
      t.string :Y_LABEL
      t.string :METHOD
      t.timestamps
    end
  end
end
