class BooksController < ApplicationController
	protect_from_forgery
  def index
    @books = Book.all
    respond_to do |format|
      format.json { render :json => { :books => @books }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @book = Book.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :book => @book }, status: :ok } 
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @book = Book.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :book => @book }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@book = Book.new(book_params)
    if @book.save
      respond_to do |format|
        format.json { render :json => { :book => @book }, status: :ok }
        format.html { redirect_to books_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :book => @book.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_book_path }
      end
    end
  end

  def update
    begin
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to @book
      else
        respond_to do |format|
          format.json { render :json => { :book => @book.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_book_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @book = Book.find(params[:id])
      if @book.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'book was deleted successfully' }, status: :ok }
          format.html { redirect_to books_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :book => @book.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :author, :code, :price, :version, :no_of_copies, :library_id, :category_id)
  end
end
