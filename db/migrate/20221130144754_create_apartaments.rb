class CreateApartaments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartaments do |t|
      t.string :ap_number
      t.string :floor
      t.integer :bedrooms
      t.float :square_meters
      t.boolean :garage
      t.references :condo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
