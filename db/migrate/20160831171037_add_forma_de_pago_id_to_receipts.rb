class AddFormaDePagoIdToReceipts < ActiveRecord::Migration
  def change
    add_reference :receipts, :forma_de_pago, index: true, foreign_key: true
  end
end
