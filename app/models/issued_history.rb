class IssuedHistory < ActiveRecord::Base
	belongs_to :book
	belongs_to :member
	validates :issue_type, presence: true, inclusion: { in: ["Rent", "rent", "Return", "return"] }
	validates :date_of_issue, presence: true
	validates :date_of_return, presence: true
end
