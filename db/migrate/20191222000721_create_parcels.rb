class CreateParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :parcels do |t|
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.decimal :weight
      t.string :distance_unit
      t.string :mass_unit

      t.timestamps
    end
  end
end
