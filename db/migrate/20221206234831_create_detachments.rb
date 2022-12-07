class CreateDetachments < ActiveRecord::Migration[7.0]
  def change
    create_table :detachments do |t|
      t.string :title
      t.string :description
      t.references :apartament, null: false, foreign_key: true
      t.references :detachment_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
