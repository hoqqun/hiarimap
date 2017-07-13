class AddTitleToHiari < ActiveRecord::Migration
  def change
    add_column :hiaris, :title, :string
  end
end
