class AddSocietyIdToReceipts < ActiveRecord::Migration
  def change
    add_reference :receipts, :society, index: true, foreign_key: true

  end
end
