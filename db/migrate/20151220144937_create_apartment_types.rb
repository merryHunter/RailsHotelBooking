class CreateApartmentTypes < ActiveRecord::Migration
  def change
    create_table :apartment_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
