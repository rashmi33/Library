class Book < ActiveRecord::Base
	belongs_to :library
	belongs_to :category
	has_many :issued_histories, dependent: :destroy
	validates :name, presence: true
	validates :author, presence: true
	validates :code, presence: true, length: { is: 6 }
	validates :price, presence: true
	validates :no_of_copies, presence: true, numericality: { only_integer: true }
end
