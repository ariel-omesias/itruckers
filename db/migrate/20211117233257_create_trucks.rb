class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string :image
      t.text :description
      t.decimal :tonnage
      t.decimal :rate
      t.string :region
      t.string :commune
      t.references :user, foreign_key: true
      t.references :type_truck, foreign_key: true

      t.timestamps
    end
  end
end
