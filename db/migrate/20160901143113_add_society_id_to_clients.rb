class AddSocietyIdToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :society, index: true, foreign_key: true
  end
end
