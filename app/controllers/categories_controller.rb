class CategoriesController < ApplicationController
	protect_from_forgery
  def index
    @categories = Category.all
    respond_to do |format|
      format.json { render :json => { :categories => @categories }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :category => @category }, status: :ok } 
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @category = Category.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :category => @category }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.json { render :json => { :category => @category }, status: :ok }
        format.html { redirect_to categories_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :category => @category.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_category_path }
      end
    end
  end

  def update
    begin
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category
      else
        respond_to do |format|
          format.json { render :json => { :category => @category.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_category_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @category = Category.find(params[:id])
      if @category.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'category was deleted successfully' }, status: :ok }
          format.html { redirect_to categories_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :category => @category.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_type)
  end
end
