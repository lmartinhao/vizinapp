class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :condo, null: false, foreign_key: true
      t.string :title
      t.references :document_category, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
