class CreateMedicalRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_records do |t|
    	t.string :diagnostic
	      t.string :symptoms
	      t.string :treatment
	      t.date :date
	      t.references :Patient, foreign_key: true, index: true
	      t.references :Doctor, foreign_key: true, index: true

      t.timestamps
    end
  end
end


