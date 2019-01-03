class Fund < ApplicationRecord
  has_many :donations
  has_many :matches
  belongs_to :user, optional: true

  validates_presence_of :name
  validates_numericality_of :total, :total_donars, on: :update

  def total_dollars
  	sum = 0
  	donations.each do |donation|
  		sum += donation.amount
  	end
  	return sum
  end

end
