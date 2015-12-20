class Room < ActiveRecord::Base
  attr_accessible :integer, :number, :persons, :price, :type_id
end
