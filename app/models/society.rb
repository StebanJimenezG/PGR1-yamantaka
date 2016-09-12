class Society < ActiveRecord::Base
  has_many :discounts
  has_many :categories, through: :discounts
  belongs_to :user

  accepts_nested_attributes_for :discounts,reject_if: :all_blank,allow_destroy: true

  validates :nombre, presence: true ,length: {minimum: 3, maximum: 50}
  validates :descripcion, presence: true ,length: {minimum: 3, maximum: 300}
  validates :val_anual, presence: true
  validates :valor_semestral, presence: true
  #validates :user_id, presence: true


end
