class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true, index: true
      t.string :street
      t.string :number
      t.string :zip_code

      t.timestamps
    end
  end
end
