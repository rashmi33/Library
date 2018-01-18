require 'rails_helper'

RSpec.describe Member, type: :model do
  context 'creation' do
    it 'creates a member with all valid attributes' do
      FactoryGirl.build(:member).should be_valid
    end
  end

  context 'validations' do
    it 'is valid with a name' do
      FactoryGirl.build(:member, name:'ABC').should be_valid
    end
    it 'is valid with a address' do
      FactoryGirl.build(:member, address: 'ABC').should be_valid
    end
    it 'is valid with a phone_no' do
      FactoryGirl.build(:member, phone_no: '878888').should be_valid
    end
    it 'is valid with a phone_no' do
      FactoryGirl.build(:member, phone_no: '87888877777777777').should be_valid
    end
    it 'is valid without is_author' do
      FactoryGirl.build(:member, is_author: nil).should be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:member, phone_no: 'ABC566577').should_not be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:member, phone_no: '7777').should_not be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:member, phone_no: '777766665555444433').should_not be_valid
    end
    it 'is valid with a code' do
      FactoryGirl.build(:member, code: 'Dgfg45').should be_valid
    end
    it 'is invalid with a wrong code' do
      FactoryGirl.build(:member, code: 'Df555').should_not be_valid
    end
    it 'is invalid with a wrong code' do
      FactoryGirl.build(:member, code: 'Df5554r').should_not be_valid
    end
    it 'is invalid without a name' do
      FactoryGirl.build(:member, name: nil).should_not be_valid
    end
    it 'is invalid without a address' do
      FactoryGirl.build(:member, address: nil).should_not be_valid
    end
    it 'is invalid without a phone_no' do
      FactoryGirl.build(:member, phone_no: nil).should_not be_valid
    end
    it 'is invalid without a code' do
      FactoryGirl.build(:member, code: nil).should_not be_valid
    end
  end

  context 'associations' do
    it 'should belong to library'do
      library = FactoryGirl.create(:library)
      member = FactoryGirl.create(:member, library_id: library.id)
      member.library.id.should eq library.id
    end
  end
end
