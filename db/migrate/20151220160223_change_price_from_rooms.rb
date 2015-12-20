class ChangePriceFromRooms < ActiveRecord::Migration
  def change
    change_column :rooms, :price, :integer
  end
end
