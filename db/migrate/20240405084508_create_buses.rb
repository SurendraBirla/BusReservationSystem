class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :name
      t.string :registration_no
      t.string :source
      t.string :destination
      t.integer :no_of_seats
      t.references :bus_owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
