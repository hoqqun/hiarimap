class ChangediscoverAriDateTodatetime < ActiveRecord::Migration
  def change
    change_column :hiaris, :discover_ari_date, :datetime
  end
end
