class Training < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :goal
    validates :reward
    validates :date_start
  end

end
