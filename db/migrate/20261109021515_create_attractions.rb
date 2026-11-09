class CreateAttractions < ActiveRecord::Migration[8.1]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.decimal :entry_fee
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
