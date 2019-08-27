class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :drug_name
      t.string :drug_strength
      t.string :drug_code
      t.references :medical_record, foreign_key: true
      
      t.timestamps
    end
  end
end
