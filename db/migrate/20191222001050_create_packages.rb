class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.string :carrier
      t.references :parcel, null: false, foreign_key: true
      t.boolean :overweight

      t.timestamps
    end
  end
end
