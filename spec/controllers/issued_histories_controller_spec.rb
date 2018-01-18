require 'rails_helper'

RSpec.describe IssuedHistoriesController, type: :controller do
  context 'GET #index' do
    it 'should display all the issued_historys' do
      FactoryGirl.create(:issued_history)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context 'GET #show' do
    context 'positive test' do
      it 'should show issued_history with given id' do
        issued_history = FactoryGirl.create(:issued_history)
        get :show, id: issued_history.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not show invalid issued_history' do
        FactoryGirl.create(:issued_history)
        get :show, id: 500, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not show invalid attribute' do
        FactoryGirl.create(:issued_history)
        get :show, id: 'ABC', format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'GET #edit' do
    context 'positive test' do
      it 'should edit issued_history with given id' do
        issued_history = FactoryGirl.create(:issued_history)
        get :edit, id: issued_history.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not edit invalid issued_history' do
        FactoryGirl.create(:issued_history)
        get :edit, id: 500, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end

  context 'POST #create' do
    context 'positive test' do
      it 'should create a valid issued_history with all attributes' do 
        post :create, issued_history: { issue_type: 'rent', date_of_issue: Faker::Date.forward(100), date_of_return: Faker::Date.forward(100), issued_no: Faker::Number.number(2) }, format: :json
        response.should have_http_status(:ok)
      end
      it 'should create a valid issued_history with manadatory attributes only' do 
        post :create, issued_history: { issue_type: 'rent', date_of_issue: Faker::Date.forward(100), date_of_return: Faker::Date.forward(100) }, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not create a issued_history with invalid attributes' do
        FactoryGirl.create(:issued_history)
        post :create, issued_history: { issue_type: 'rent' }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not create a issued_history with nil values' do
        FactoryGirl.create(:issued_history)
        post :create, issued_history: { issue_type: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end 

  context 'PUT #update' do
    context 'positive test' do
      it 'should update the issued_history with valid attributes' do
        issued_history = FactoryGirl.create(:issued_history)
        put :update ,id: issued_history.id, issued_history: { issue_type: 'rent', date_of_issue: Faker::Date.forward(100), date_of_return: Faker::Date.forward(100), issued_no: Faker::Number.number(2) }
        expect(response).to redirect_to issued_history_path(issued_history.id)
      end
    end
    context 'negative test' do
      it 'should not update issued_history with invalid id' do
        FactoryGirl.create(:issued_history)
        put :update, { id: 511 }, issued_history: { issue_type: 'ABC' }, format: :json
        response.should have_http_status(:not_found)
      end
      it 'should not update issued_history with invalid attributes' do
        issued_history = FactoryGirl.create(:issued_history)
        put :update, id: issued_history.id, issued_history: { issue_type: nil, date_of_issue: Faker::Date.forward(100), date_of_return: Faker::Date.forward(100), issued_no: Faker::Number.number(2) }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not update issued_history with invalid issue_type' do
        issued_history = FactoryGirl.create(:issued_history)
        put :update, id: issued_history.id, issued_history: { issue_type: 'ABC', date_of_issue: Faker::Date.forward(100), date_of_return: Faker::Date.forward(100), issued_no: Faker::Number.number(2) }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE #destroy' do
    context 'positive test' do
      it 'should delete the issued_history' do
        issued_history = FactoryGirl.create(:issued_history)
        delete :destroy, id: issued_history.id, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not delete a issued_history with invalid id' do
        FactoryGirl.create(:issued_history)
        delete :destroy, id: 555, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end
end