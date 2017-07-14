class AddUseridToHiaris < ActiveRecord::Migration
  def change
    add_column :hiaris, :user_id, :integer
  end
end
