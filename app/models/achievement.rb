class Achievement < ApplicationRecord
  belongs_to :training
  belongs_to :user
  has_one_attached :image

  validates :date_end, presence: true

end
