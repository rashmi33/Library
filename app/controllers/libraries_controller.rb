class LibrariesController < ApplicationController
	protect_from_forgery
  def index
    @libraries = Library.all
    respond_to do |format|
      format.json { render json: { libraries: @libraries }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @library = Library.find(params[:id])
      respond_to do |format|
        format.json { render json: { library: @library }, status: :ok } 
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @library = Library.find(params[:id])
      respond_to do |format|
        format.json { render json: { library: @library }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@library = Library.new(library_params)
    if @library.save
      respond_to do |format|
        format.json { render json: { library: @library }, status: :ok }
        format.html { redirect_to libraries_path }
      end
    else
      respond_to do |format|
        format.json { render json: { library: @library.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_library_path }
      end
    end
  end

  def update
    begin
      @library = Library.find(params[:id])
      if @library.update(library_params)
        redirect_to @library
      else
        respond_to do |format|
          format.json { render json: { library: @library.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_library_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @library = Library.find(params[:id])
      if @library.destroy
        respond_to do |format|
          format.json { render json: { :message => 'Library was deleted successfully' }, status: :ok }
          format.html { redirect_to libraries_path }
        end
      else
        respond_to do |format|
          format.json { render json: { library: @library.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def library_params
    params.require(:library).permit(:name, :address, :phone_no)
  end
end
