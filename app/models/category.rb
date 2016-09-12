class Category < ActiveRecord::Base
  has_many :discounts
  has_many :societies, through: :discounts
  belongs_to :user

  validates :nombre, presence: true ,length: {minimum: 3, maximum: 50}
  validates :descripcion, presence: true, length: {minimum: 10, maximum: 300}
  #validates :user_id, presence: true

end
