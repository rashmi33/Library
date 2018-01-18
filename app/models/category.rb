class Category < ActiveRecord::Base
	has_many :books, dependent: :destroy
	validates :category_type, presence: true
end
