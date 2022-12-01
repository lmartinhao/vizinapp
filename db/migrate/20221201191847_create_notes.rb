class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :condo, null: false, foreign_key: true
      t.string :title
      t.date :noteDate
      t.references :note_category, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
