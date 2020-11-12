class Training < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :achievement

  with_options presence: true do
    validates :goal
    validates :reward
    validates :date_start
    validates :image
    validates :expected_date
  end

end
