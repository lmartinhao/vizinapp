class Note < ApplicationRecord
  belongs_to :condo
  belongs_to :note_category
  has_one_attached :note_file

  def format_date_note
    noteDate.strftime('%d/%m/%Y')
  end

end
