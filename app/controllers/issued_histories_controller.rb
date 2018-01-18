class IssuedHistoriesController < ApplicationController
	protect_from_forgery
  def index
    @issued_histories = IssuedHistory.all
    respond_to do |format|
      format.json { render :json => { :issued_histories => @issued_histories }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @issued_history = IssuedHistory.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :issued_history => @issued_history }, status: :ok } 
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @issued_history = IssuedHistory.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :issued_history => @issued_history }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@issued_history = IssuedHistory.new(issued_history_params)
    if @issued_history.save
      respond_to do |format|
        format.json { render :json => { :issued_history => @issued_history }, status: :ok }
        format.html { redirect_to issued_histories_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :issued_history => @issued_history.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_issued_history_path }
      end
    end
  end

  def update
    begin
      @issued_history = IssuedHistory.find(params[:id])
      if @issued_history.update(issued_history_params)
        redirect_to @issued_history
      else
        respond_to do |format|
          format.json { render :json => { :issued_history => @issued_history.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_issued_history_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @issued_history = IssuedHistory.find(params[:id])
      if @issued_history.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'issued_history was deleted successfully' }, status: :ok }
          format.html { redirect_to issued_histories_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :issued_history => @issued_history.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def issued_history_params
    params.require(:issued_history).permit(:issue_type, :date_of_issue, :date_of_return, :issued_no, :book_id, :member_id)
  end
end
