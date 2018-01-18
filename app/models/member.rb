class Member < ActiveRecord::Base
	belongs_to :library
	has_many :issued_histories, dependent: :destroy
	validates :name, presence: true
	validates :address, presence: true
	validates :phone_no, presence: true, length: { maximum: 17, minimum: 5 }, numericality: { only_integer: true }
	validates :code, presence: true, length: { is: 6 }
end
