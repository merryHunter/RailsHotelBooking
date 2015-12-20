class Booking < ActiveRecord::Base
  attr_accessible :entry, :final, :room_id, :user_id

  has_many :rooms
  has_many :users

end
