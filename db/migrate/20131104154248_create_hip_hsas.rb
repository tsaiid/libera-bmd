class CreateHipHsas < ActiveRecord::Migration
  def change
    create_table :hip_hsas do |t|
      t.string :PATIENT_KEY
      t.string :SCANID, :null => false
      t.string :SERIAL_NUMBER, :null => false
      t.float :NN_BMD
      t.float :NN_CSA
      t.float :NN_CSMI
      t.float :NN_WIDTH
      t.float :NN_ED
      t.float :NN_ACT
      t.float :NN_PCD
      t.float :NN_CMP
      t.float :NN_SECT_MOD
      t.float :NN_BR
      t.float :IT_BMD
      t.float :IT_CSA
      t.float :IT_CSMI
      t.float :IT_WIDTH
      t.float :IT_ED
      t.float :IT_ACT
      t.float :IT_PCD
      t.float :IT_CMP
      t.float :IT_SECT_MOD
      t.float :IT_BR
      t.float :FS_BMD
      t.float :FS_CSA
      t.float :FS_CSMI
      t.float :FS_WIDTH
      t.float :FS_ED
      t.float :FS_ACT
      t.float :FS_PCD
      t.float :FS_CMP
      t.float :FS_SECT_MOD
      t.float :FS_BR
      t.float :SHAFT_NECK_ANGLE
      t.float :VAR1
      t.float :VAR2
      t.float :VAR3
      t.float :VAR4
      t.float :VAR5
      t.float :VAR6
      t.timestamps
    end
  end
end
