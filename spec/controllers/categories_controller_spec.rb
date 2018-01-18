require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'GET #index' do
    it 'should display all the categories' do
      FactoryGirl.create(:category)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context 'GET #show' do
    context 'positive test' do
      it 'should show category with given id' do
        category = FactoryGirl.create(:category)
        get :show, id: category.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not show invalid category' do
        FactoryGirl.create(:category)
        get :show, id: 500, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not show invalid attribute' do
        FactoryGirl.create(:category)
        get :show, id: 'ABC', format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'GET #edit' do
    context 'positive test' do
      it 'should edit category with given id' do
        category = FactoryGirl.create(:category)
        get :edit, id: category.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not edit invalid category' do
        FactoryGirl.create(:category)
        get :edit, id: 500, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end

  context 'POST #create' do
    context 'positive test' do
      it 'should create a valid category with all attributes' do 
        post :create, category: { category_type: 'Educational' }, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not create a category with invalid attributes' do
        FactoryGirl.create(:category)
        post :create, category: { category_type: '^$##' }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not create a category with nil values' do
        FactoryGirl.create(:category)
        post :create, category: { name: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end 

  context 'PUT #update' do
    context 'positive test' do
      it 'should update the category with valid attributes' do
        category = FactoryGirl.create(:category)
        put :update ,id: category.id, category: { category_type: 'Educational' }
        expect(response).to redirect_to category_path(category.id)
      end
    end
    context 'negative test' do
      it 'should not update category with invalid id' do
        FactoryGirl.create(:category)
        put :update, { id: 511 }, category: { category_type: 'Educational' }, format: :json
        response.should have_http_status(:not_found)
      end
      it 'should not update category with invalid attributes' do
        category = FactoryGirl.create(:category)
        put :update, id: category.id, category: { category_type: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE #destroy' do
    context 'positive test' do
      it 'should delete the category' do
        category = FactoryGirl.create(:category)
        delete :destroy, id: category.id, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not delete a category with invalid id' do
        FactoryGirl.create(:category)
        delete :destroy, id: 555, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end
end