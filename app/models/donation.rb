class Donation < ApplicationRecord
	belongs_to :fund, optional: true
	belongs_to :user, optional: true

	validates_presence_of :amount
	validates_numericality_of :amount

	def check_matches
		fund.matches.each do |match|
			if match.is_one_to_one_match
				donation = Donation.new(amount: amount, fund_id: fund_id, user_id: match.user_id)
			elsif match.is_set_match
				new_amount = amount / match.base * match.match
				donation = Donation.new(amount: new_amount, fund_id: fund_id, user_id:match.user_id)
			else
				donation = Donation.new(amount: match.match, fund_id:fund_id, user_id:match.user_id)
			end

			if match.cap != nil and donation.amount > match.cap
				donation.amount = match.cap
			end

			donation.save
		end
	end
end
