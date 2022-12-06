class AddAreaCategoryToArea < ActiveRecord::Migration[7.0]
  def change
    add_reference :areas, :area_category, null: false, foreign_key: true
  end
end
