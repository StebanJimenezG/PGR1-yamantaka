class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :nombre
      t.string :descripcion
      t.float :val_anual
      t.float :val_semestral
      t.float :val_mensual

      t.timestamps null: false
    end
  end
end
