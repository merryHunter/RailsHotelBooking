class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :user_id
      t.date :entry
      t.date :final

      t.timestamps
    end
  end
end
