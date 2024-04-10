class CreateSeats < ActiveRecord::Migration[7.1]
  def change
    create_table :seats do |t|
      t.integer :seat_number
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
