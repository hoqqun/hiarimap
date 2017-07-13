class CreateHiaris < ActiveRecord::Migration
  def change
    create_table :hiaris do |t|
      t.float :latitude
      t.float :longitude
      t.text  :comment
      t.string :image
      t.date :discover_ari_date
      t.timestamps null: false
    end
  end
end
