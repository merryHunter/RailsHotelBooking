class Request < ActiveRecord::Base
  attr_accessible :comment, :entry, :final, :name, :persons, :type_id, :user_id, :status
  has_many :users
  has_many :apartment_types

  def status?
    if :status == 0
      "rejected"
    elsif :status == 1
      "assinged"
      else "unknown"
    end
  end

end
