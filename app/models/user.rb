class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :trainings
  has_many :achievements

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :age
    belongs_to :sex
    belongs_to :figure

  with_options presence: true do
    validates :nickname
    validates :sex
    validates :age
    validates :figure
  end

  validates :sex_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :age_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :figure_id, numericality: { other_than: 1, message: 'を選択してください' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
