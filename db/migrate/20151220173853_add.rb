class Add < ActiveRecord::Migration
  def change
    add_column :requests, :status, :integer
  end
end
