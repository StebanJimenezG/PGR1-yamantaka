class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.date :fecha
      t.float :valor_total
      t.references :client, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_attachment :receipts, :soporte
  end
end
