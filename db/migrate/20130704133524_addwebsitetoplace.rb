class Addwebsitetoplace < ActiveRecord::Migration
  def change
    add_column :places, :website, :string
  end
end
