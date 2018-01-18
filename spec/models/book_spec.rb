require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'creation' do
    it 'creates a book with all valid attributes' do
      FactoryGirl.build(:book).should be_valid
    end
  end

  context 'validations' do
    it 'is valid with a name' do
      FactoryGirl.build(:book, name:'ABC').should be_valid
    end
    it 'is valid with an author' do
      FactoryGirl.build(:book, author: 'ABC').should be_valid
    end
    it 'is valid with a code' do
      FactoryGirl.build(:book, code: 'Dgfg45').should be_valid
    end
    it 'is invalid with a wrong code' do
      FactoryGirl.build(:book, code: 'Df555').should_not be_valid
    end
    it 'is invalid with a wrong code' do
      FactoryGirl.build(:book, code: 'Df5554r').should_not be_valid
    end
    it 'is valid with a price' do
      FactoryGirl.build(:book, price: '200').should be_valid
    end
    it 'is valid with a price' do
      FactoryGirl.build(:book, price: '200.50').should be_valid
    end
    it 'is valid with no_of_copies' do
      FactoryGirl.build(:book, no_of_copies: 50).should be_valid
    end
    it 'is invalid with wrong no_of_copies' do
      FactoryGirl.build(:book, no_of_copies: 50.5).should_not be_valid
    end
    it 'is valid without a version' do
      FactoryGirl.build(:book, version: nil).should be_valid
    end
    it 'is invalid without a name' do
      FactoryGirl.build(:book, name: nil).should_not be_valid
    end
    it 'is invalid without an author' do
      FactoryGirl.build(:book, author: nil).should_not be_valid
    end
    it 'is invalid without a code' do
      FactoryGirl.build(:book, code: nil).should_not be_valid
    end
    it 'is invalid without a price' do
      FactoryGirl.build(:book, price: nil).should_not be_valid
    end
    it 'is invalid without a no_of_copies' do
      FactoryGirl.build(:book, no_of_copies: nil).should_not be_valid
    end
  end

  context 'associations' do
    it 'should belong to library'do
      library = FactoryGirl.create(:library)
      book = FactoryGirl.create(:book, library_id: library.id)
      book.library.id.should eq library.id
    end
    it 'should belong to category'do
      category = FactoryGirl.create(:category)
      book = FactoryGirl.create(:book, category_id: category.id)
      book.category.id.should eq category.id
    end
  end
end
