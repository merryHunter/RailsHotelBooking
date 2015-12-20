class Room < ActiveRecord::Base
  attr_accessible :integer, :number, :persons, :price, :type_id

  belongs_to :booking
  has_many :apartment_types

end
