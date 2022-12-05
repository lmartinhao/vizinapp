class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.references :condo, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
