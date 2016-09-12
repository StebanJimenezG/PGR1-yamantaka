class Receipt < ActiveRecord::Base
  belongs_to :client
  belongs_to :society
  belongs_to :forma_de_pago
  belongs_to :user
  has_attached_file :soporte, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :soporte, content_type: /\Aimage\/.*\z/


  validates :fecha, presence: true
  validates :valor_total, presence: true

  #validates :user_id, presence: true


end
