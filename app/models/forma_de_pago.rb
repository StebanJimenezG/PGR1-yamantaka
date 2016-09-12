class FormaDePago < ActiveRecord::Base
  has_many :receipts

  validates :nombre, presence: true
   #validates :user_id, presence: true
end
