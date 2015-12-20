class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :persons
      t.string :type_id
      t.string :integer
      t.decimal :price

      t.timestamps
    end
  end
end
