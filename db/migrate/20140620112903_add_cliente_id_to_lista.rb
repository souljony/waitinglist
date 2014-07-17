class AddClienteIdToLista < ActiveRecord::Migration
  def change
    add_column :lista, :cliente_id, :integer
  end
end
