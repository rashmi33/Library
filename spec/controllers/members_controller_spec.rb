require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  context 'GET #index' do
    it 'should display all the members' do
      FactoryGirl.create(:member)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context 'GET #show' do
    context 'positive test' do
      it 'should show member with given id' do
        member = FactoryGirl.create(:member)
        get :show, id: member.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not show invalid member' do
        FactoryGirl.create(:member)
        get :show, id: 500, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not show invalid attribute' do
        FactoryGirl.create(:member)
        get :show, id: 'ABC', format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'GET #edit' do
    context 'positive test' do
      it 'should edit member with given id' do
        member = FactoryGirl.create(:member)
        get :edit, id: member.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not edit invalid member' do
        FactoryGirl.create(:member)
        get :edit, id: 500, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end

  context 'POST #create' do
    context 'positive test' do
      it 'should create a valid member with all attributes' do 
        post :create, member: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(17), code: 'Dgg566', is_author: false }, format: :json
        response.should have_http_status(:ok)
      end
      it 'should create a valid member with manadatory attributes only' do 
        post :create, member: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(17), code: 'Dgg566' }, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not create a member with invalid attributes' do
        FactoryGirl.create(:member)
        post :create, member: { name: Faker::Name.first_name }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not create a member with nil values' do
        FactoryGirl.create(:member)
        post :create, member: { name: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end 

  context 'PUT #update' do
    context 'positive test' do
      it 'should update the member with valid attributes' do
        member = FactoryGirl.create(:member)
        put :update, id: member.id, member: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(17), code: 'Dgg566', is_author: false }
        expect(response).to redirect_to member_path(member.id)
      end
    end
    context 'negative test' do
      it 'should not update member with invalid id' do
        FactoryGirl.create(:member)
        put :update, { id: 511 }, member: { name: 'ABC' }, format: :json
        response.should have_http_status(:not_found)
      end
      it 'should not update member with invalid attributes' do
        member = FactoryGirl.create(:member)
        put :update, id: member.id, member: { name: nil, address: Faker::Address.street_address, phone_no: Faker::Number.number(17), code: 'Dgg566', is_author: false }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE #destroy' do
    context 'positive test' do
      it 'should delete the member' do
        member = FactoryGirl.create(:member)
        delete :destroy, id: member.id, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not delete a member with invalid id' do
        FactoryGirl.create(:member)
        delete :destroy, id: 555, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end
end