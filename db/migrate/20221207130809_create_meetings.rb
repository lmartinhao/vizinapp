class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.references :area, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :schedule_date

      t.timestamps
    end
  end
end
