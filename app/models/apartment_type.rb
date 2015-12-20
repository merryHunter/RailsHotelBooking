class ApartmentType < ActiveRecord::Base
  attr_accessible :title

  belongs_to :room
end
