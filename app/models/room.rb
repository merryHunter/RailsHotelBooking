class Room < ActiveRecord::Base
  attr_accessible :integer, :number, :persons, :price, :type_id

  has_many :apartment_types
end
