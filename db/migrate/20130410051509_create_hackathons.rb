class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :city
      t.string :name
      t.datetime :date
      t.string :where
      t.string :info

      t.timestamps
    end
  end
end
