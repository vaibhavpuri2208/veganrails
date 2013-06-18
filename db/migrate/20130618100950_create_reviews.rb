class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :score
      t.string :comment
      t.integer :place_id

      t.timestamps
    end
  end
end
