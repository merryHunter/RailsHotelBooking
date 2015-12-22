class Request < ActiveRecord::Base
  attr_accessible :comment, :entry, :final, :name, :persons, :type_id, :user_id, :status
  has_many :users
  has_many :apartment_types

  validate :persons, :name, :presence => true
  # validates :persons => {:greater_than_or_equal_to => 1}

#   validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    errors.add(:expiration_date, "can't be in the past") if
        (!entry.blank? and entry < Date.today) or
        (!final.blank? and final < Date.today) or
        (entry < final)
  end
  def status?
    if :status == 0
      "rejected"
    elsif :status == 1
      "assinged"
      else "unknown"
    end
  end

end
