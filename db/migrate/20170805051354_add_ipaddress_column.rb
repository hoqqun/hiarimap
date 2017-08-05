class AddIpaddressColumn < ActiveRecord::Migration
  def change
    add_column :hiaris, :ipaddress, :string
  end
end
