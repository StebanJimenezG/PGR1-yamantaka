class Client < ActiveRecord::Base
  has_many :receipts
  accepts_nested_attributes_for :receipts
  after_create :save_receipt
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
