class CreateLista < ActiveRecord::Migration
  def change
    create_table :lista do |t|
      t.string :nome
      t.integer :pax
      t.boolean :sentado
      t.datetime :sentado_em

      t.timestamps
    end
  end
end
