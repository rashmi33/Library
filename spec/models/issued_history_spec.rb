require 'rails_helper'

RSpec.describe IssuedHistory, type: :model do
  context 'creation' do
    it 'creates a issued_history with all valid attributes' do
      FactoryGirl.build(:issued_history).should be_valid
    end
  end

  context 'validations' do
    it 'is valid with a issue_type' do
      FactoryGirl.build(:issued_history, issue_type:'rent').should be_valid
    end
     it 'is valid with a issue_type' do
      FactoryGirl.build(:issued_history, issue_type:'return').should be_valid
    end
    it 'is invalid with a wrong issue_type' do
      FactoryGirl.build(:issued_history, issue_type:'ABC').should_not be_valid
    end
    it 'is valid with a date_of_issue' do
      FactoryGirl.build(:issued_history, date_of_issue: '18/01/2018').should be_valid
    end
    it 'is valid with a date_of_return' do
      FactoryGirl.build(:issued_history, date_of_return: '18/01/2018').should be_valid
    end
    it 'is valid without a issued_no' do
      FactoryGirl.build(:issued_history, issued_no: nil).should be_valid
    end
    it 'is invalid without a issue_type' do
      FactoryGirl.build(:issued_history, issue_type: nil).should_not be_valid
    end
    it 'is invalid without a date_of_issue' do
      FactoryGirl.build(:issued_history, date_of_issue: nil).should_not be_valid
    end
    it 'is invalid without a date_of_return' do
      FactoryGirl.build(:issued_history, date_of_return: nil).should_not be_valid
    end
  end

  context 'associations' do
    it 'should belong to library'do
      book = FactoryGirl.create(:book)
      issued_history = FactoryGirl.create(:issued_history, book_id: book.id)
      issued_history.book.id.should eq book.id
    end
    it 'should belong to issued_history'do
      member = FactoryGirl.create(:member)
      issued_history = FactoryGirl.create(:issued_history, member_id: member.id)
      issued_history.member.id.should eq member.id
    end
  end
end
