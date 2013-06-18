class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :phone
      t.integer :city_id
      t.integer :category_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
