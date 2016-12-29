class AddOccupancyToTrouble < ActiveRecord::Migration[5.0]
  def change
    add_column :troubles, :occupancy, :date
  end
end
