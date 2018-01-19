require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context 'GET #index' do
    it 'should display all the books' do
      FactoryGirl.create(:book)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context 'GET #show' do
    context 'positive test' do
      it 'should show book with given id' do
        book = FactoryGirl.create(:book)
        get :show, id: book.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not show invalid book' do
        FactoryGirl.create(:book)
        get :show, id: 500, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not show invalid attribute' do
        FactoryGirl.create(:book)
        get :show, id: 'ABC', format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'GET #edit' do
    context 'positive test' do
      it 'should edit book with given id' do
        book = FactoryGirl.create(:book)
        get :edit, id: book.id, format: 'json'
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not edit invalid book' do
        FactoryGirl.create(:book)
        get :edit, id: 500, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end

  context 'POST #create' do
    context 'positive test' do
      it 'should create a valid book with all attributes' do 
        post :create, book: { name: Faker::Name.first_name, author: Faker::Name.first_name, code: 'Dgg566', price: Faker::Number.decimal(5, 2), no_of_copies: Faker::Number.number(3), version: Faker::Number.decimal(2, 3) }, format: :json
        response.should have_http_status(:ok)
      end
      it 'should create a valid book with manadatory attributes only' do 
        post :create, book: { name: Faker::Name.first_name, author: Faker::Name.first_name, code: 'Dgg566', price: Faker::Number.decimal(5, 2), no_of_copies: Faker::Number.number(3) }, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not create a book with invalid attributes' do
        FactoryGirl.create(:book)
        post :create, book: { name: Faker::Name.first_name }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
      it 'should not create a book with nil values' do
        FactoryGirl.create(:book)
        post :create, book: { name: nil }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end 

  context 'PUT #update' do
    context 'positive test' do
      it 'should update the book with valid attributes' do
        book = FactoryGirl.create(:book)
        put :update, id: book.id, book: { name: Faker::Name.first_name, author: Faker::Name.first_name, code: 'Dgg566', price: Faker::Number.decimal(5, 2), no_of_copies: Faker::Number.number(3), version: Faker::Number.decimal(2, 3) }
        expect(response).to redirect_to book_path(book.id)
      end
    end
    context 'negative test' do
      it 'should not update book with invalid id' do
        FactoryGirl.create(:book)
        put :update, { id: 511 }, book: { name: 'ABC' }, format: :json
        response.should have_http_status(:not_found)
      end
      it 'should not update book with invalid attributes' do
        book = FactoryGirl.create(:book)
        put :update, id: book.id, book: { name: nil, author: Faker::Name.first_name, code: 'Dgg566', price: Faker::Number.decimal(5, 2), no_of_copies: Faker::Number.number(3), version: Faker::Number.decimal(2, 3) }, format: :json
        response.should have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE #destroy' do
    context 'positive test' do
      it 'should delete the book' do
        book = FactoryGirl.create(:book)
        delete :destroy, id: book.id, format: :json
        response.should have_http_status(:ok)
      end
    end
    context 'negative test' do
      it 'should not delete a book with invalid id' do
        FactoryGirl.create(:book)
        delete :destroy, id: 555, format: :json
        response.should have_http_status(:not_found)
      end
    end
  end
end