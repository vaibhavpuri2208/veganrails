class Phonetostring < ActiveRecord::Migration
  def change
       change_column :places, :phone, :string


  end


end
