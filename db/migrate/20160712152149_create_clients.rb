class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :documento, :limit => 8
      t.string :tipo_documento
      t.string :nombre
      t.string :apellido
      t.integer :telefono, :limit => 8
      t.string :direccion
      t.string :pais
      t.string :ciudad
      t.string :email

      t.timestamps null: false
    end
  end
end
