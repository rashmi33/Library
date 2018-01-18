class Library < ActiveRecord::Base
	has_many :books, dependent: :destroy
	has_many :members, dependent: :destroy
	validates :name, presence: true
	validates :address, presence: true
	validates :phone_no, presence: true, length: { maximum: 17, minimum: 5 }, numericality: { only_integer: true }
end
