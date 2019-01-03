class Match < ApplicationRecord
	validates_presence_of :fund_id
	validate :check_match_parameters, on: :create

	belongs_to :fund, optional: true
	belongs_to :user, optional: true

	def check_match_parameters
		if self.is_person_match
			return (self.match != nil and self.match.is_a? Integer)
		end

		if self.is_set_match
			return (self.match != nil and self.base != nil and self.match.is_a? Integer and self.base.is_a? Integer)
		end
	end
end
