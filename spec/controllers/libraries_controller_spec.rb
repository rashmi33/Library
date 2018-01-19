require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
  context 'GET #index' do
    it 'should display all the libraries' do
      FactoryGirl.create(:library)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context 'GET #show' do
    context 'positive test' do
      it 'should show library with given id' do
        library = FactoryGirl.create(:library)
        get :show, id: library.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not show invalid library' do
        FactoryGirl.create(:library)
        get :show, id: 500, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not show invalid attribute' do
        FactoryGirl.create(:library)
        get :show, id: 'ABC', format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'GET #edit' do
    context 'positive test' do
      it 'should edit library with given id' do
        library = FactoryGirl.create(:library)
        get :edit, id: library.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not edit invalid library' do
        FactoryGirl.create(:library)
        get :edit, id: 500, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end

  context 'POST #create' do
    context 'positive test' do
      it 'should create a valid library with all attributes' do 
        post :create, library: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(17) }, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not create a library with invalid attributes' do
        FactoryGirl.create(:library)
        post :create, library: { name: Faker::Name.first_name }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not create a library with nil values' do
        FactoryGirl.create(:library)
        post :create, library: { name: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end 

  context 'PUT #update' do
    context 'positive test' do
      it 'should update the library with valid attributes' do
        library = FactoryGirl.create(:library)
        put :update, id: library.id, library: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(17) }
        expect(response).to redirect_to library_path(library.id)
      end
    end
    context 'negative test' do
      it 'should not update library with invalid id' do
        FactoryGirl.create(:library)
        put :update, { id: 511 }, library: { name: 'ABC' }, format: :json
        response.should have_http_status(:not_found)
      end
      it 'should not update library with invalid attributes' do
        library = FactoryGirl.create(:library)
        put :update, id: library.id, library: { name: nil, address: library.address, phone_no: library.phone_no }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE #destroy' do
    context 'positive test' do
      it 'should delete the library' do
        library = FactoryGirl.create(:library)
        delete :destroy, id: library.id, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not delete a library with invalid id' do
        FactoryGirl.create(:library)
        delete :destroy, id: 555, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end
end