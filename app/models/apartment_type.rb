class ApartmentType < ActiveRecord::Base
  attr_accessible :title

  belongs_to :room
  belongs_to :request
end
