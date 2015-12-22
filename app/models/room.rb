class Room < ActiveRecord::Base
  attr_accessible :integer, :number, :persons, :price, :type_id

  # validates :number, :persons, :price => {:greater_than_or_equal_to => 1}

  belongs_to :booking
  has_many :apartment_types

end
