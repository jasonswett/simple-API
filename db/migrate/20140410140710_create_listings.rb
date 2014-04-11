class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.string :slug, null: false, unique: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
