class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :surname
      t.string :address
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
