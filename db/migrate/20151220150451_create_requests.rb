class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :type_id
      t.string :name
      t.text :comment
      t.integer :persons
      t.date :entry
      t.date :final

      t.timestamps
    end
  end
end
