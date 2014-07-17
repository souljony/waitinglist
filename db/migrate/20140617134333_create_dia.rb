class CreateDia < ActiveRecord::Migration
  def change
    create_table :dia do |t|

      t.timestamps
    end
  end
end
