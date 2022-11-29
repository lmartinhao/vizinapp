class CreateCondos < ActiveRecord::Migration[7.0]
  def change
    create_table :condos do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :city
      t.references :uf, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
