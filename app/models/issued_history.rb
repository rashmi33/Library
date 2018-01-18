class IssuedHistory < ActiveRecord::Base
	belongs_to :books
	belongs_to :members
	validates :issue_type, presence: true, inclusion: { in: ["Rent", "rent", "Return", "return"] }
	validates :date_of_issue, presence: true
	validates :date_of_return, presence: true
end
