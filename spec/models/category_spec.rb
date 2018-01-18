require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'creation' do
    it 'creates a category with all valid attributes' do
      FactoryGirl.build(:category).should be_valid
    end
  end

  context 'validations' do
    it 'is valid with a category_type' do
      FactoryGirl.build(:category, category_type:'ABC').should be_valid
    end
    it 'is invalid without a category_type' do
      FactoryGirl.build(:category, category_type: nil).should_not be_valid
    end
  end
end
