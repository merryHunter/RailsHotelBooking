class RemoveIntegerFromRooms < ActiveRecord::Migration
  def change
      remove_column :rooms, :integer
  end
end
