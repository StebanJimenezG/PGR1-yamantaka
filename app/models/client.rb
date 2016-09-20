class Client < ActiveRecord::Base
  has_many :receipts
  belongs_to :user
  accepts_nested_attributes_for :receipts
  after_create :save_receipt

  validates :documento, presence: true , uniqueness: true, length: {minimum: 3, maximum: 50}
  validates :tipo_documento, presence: true

  validates :nombre, presence: true ,length: {minimum: 3, maximum: 50}
  validates :apellido, presence: true, length: {minimum: 3, maximum: 50}

  validates :telefono, presence: true ,length: {minimum: 3, maximum: 50}
  validates :direccion, presence: true, length: {minimum: 10, maximum: 300}


  validates :pais, presence: true
  validates :ciudad, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  uniqueness: { case_sensitive: false},
  length: { maximum:105 },
  format: { with: VALID_EMAIL_REGEX }

  
  #validates :user_id, presence: true


  #after_create :send_mail

  def f_pago=(f_pago)
    @f_pago = f_pago
  end
  def societyId=(id)
    @society_id=id
  end
  def valor=(value)
    @valor = value
  end
  def soporte=(support)
    @support = support
  end
  def sed_mail
    @s = Society.find(params[:self.society_id])
    SocietyMailer.new_society(@s).deliver_later
  end
  def save_receipt
    t = Time.new
    Receipt.create(fecha: t,client_id: self.id, forma_de_pago_id: @f_pago, society_id: self.society_id, valor_total: @valor, soporte: @support )
  end
end
