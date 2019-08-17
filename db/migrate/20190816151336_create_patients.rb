class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :surname
      t.string :phone_number
      t.string :address
      t.date :datebirth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
