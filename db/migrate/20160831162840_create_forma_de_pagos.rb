class CreateFormaDePagos < ActiveRecord::Migration
  def change
    create_table :forma_de_pagos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
