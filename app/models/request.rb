class Request < ActiveRecord::Base
  attr_accessible :comment, :entry, :final, :name, :persons, :type_id, :user_id
  has_many :users
  has_many :apartment_types
end
