class Achievement < ApplicationRecord
  belongs_to :training
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
   validates :date_end
  #  validates :image
  end

end
