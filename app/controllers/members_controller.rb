class MembersController < ApplicationController
	protect_from_forgery
  def index
    @members = Member.all
    respond_to do |format|
      format.json { render :json => { :members => @members }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @member = Member.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :member => @member }, status: :ok } 
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @member = Member.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :member => @member }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@member = Member.new(member_params)
    if @member.save
      respond_to do |format|
        format.json { render :json => { :member => @member }, status: :ok }
        format.html { redirect_to members_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :member => @member.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_member_path }
      end
    end
  end

  def update
    begin
      @member = Member.find(params[:id])
      if @member.update(member_params)
        redirect_to @member
      else
        respond_to do |format|
          format.json { render :json => { :member => @member.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_member_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @member = Member.find(params[:id])
      if @member.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'member was deleted successfully' }, status: :ok }
          format.html { redirect_to members_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :member => @member.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :address, :phone_no, :code, :is_author, :library_id)
  end
end
