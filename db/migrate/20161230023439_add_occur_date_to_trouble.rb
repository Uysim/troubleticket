class AddOccurDateToTrouble < ActiveRecord::Migration[5.0]
  def change
    add_column :troubles, :occur_date, :datetime
  end
end
