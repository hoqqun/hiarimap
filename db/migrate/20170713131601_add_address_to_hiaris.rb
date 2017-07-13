class AddAddressToHiaris < ActiveRecord::Migration
  def change
    add_column :hiaris, :address, :string
  end
end
