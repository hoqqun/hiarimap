class AddReltoHiaris < ActiveRecord::Migration
  def change
    add_column :hiaris, :reliability , :integer
    add_column :hiaris, :source, :string
  end
end
