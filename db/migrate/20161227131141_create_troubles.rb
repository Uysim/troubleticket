class CreateTroubles < ActiveRecord::Migration[5.0]
  def change
    create_table :troubles do |t|
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true
      t.string :range
      t.string :state
      t.text :detail

      t.timestamps
    end
  end
end
