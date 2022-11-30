class AddCondoToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :condo, null: true, foreign_key: true
  end
end
