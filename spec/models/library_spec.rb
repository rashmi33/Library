require 'rails_helper'

RSpec.describe Library, type: :model do
  context 'creation' do
    it 'creates a library with all valid attributes' do
      FactoryGirl.build(:library).should be_valid
    end
  end

  context 'validations' do
    it 'is valid with a name' do
      FactoryGirl.build(:library, name:'ABC').should be_valid
    end
    it 'is valid with a address' do
      FactoryGirl.build(:library, address: 'ABC').should be_valid
    end
    it 'is valid with a phone_no' do
      FactoryGirl.build(:library, phone_no: '878888').should be_valid
    end
    it 'is valid with a phone_no' do
      FactoryGirl.build(:library, phone_no: '87888877777777777').should be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:library, phone_no: 'ABC566577').should_not be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:library, phone_no: '7777').should_not be_valid
    end
    it 'is invalid with a wrong phone_no' do
      FactoryGirl.build(:library, phone_no: '777766665555444433').should_not be_valid
    end
    it 'is invalid without a name' do
      FactoryGirl.build(:library, name: nil).should_not be_valid
    end
    it 'is invalid without a address' do
      FactoryGirl.build(:library, address: nil).should_not be_valid
    end
    it 'is invalid without a phone_no' do
      FactoryGirl.build(:library, phone_no: nil).should_not be_valid
    end
  end
end