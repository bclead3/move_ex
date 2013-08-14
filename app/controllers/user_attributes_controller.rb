class UserAttributesController < ApplicationController
  before_action :signed_in_user
  before_action :set_attribute, only: [:show, :edit, :update, :destroy]

  def index
    user_id_value = params[:format]
    @user = User.find(user_id_value)
    @attributes = UserAttribute.where(user_id: @user.id)
  end

  def show
  end

  def new
    user_id = params[:format]
    @user = User.find(user_id)
    @attribute = UserAttribute.new
    @attribute.user = @user
  end

  def edit
  end

  def create
    @attribute = UserAttribute.new(user_attribute_params)

    respond_to do |format|
      if @attribute.save
        format.html { redirect_to @attribute, notice: 'Attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      if @attribute.update(user_attribute_params)
        format.html { redirect_to @attribute, notice: 'Attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attribute.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def set_attribute
    @attribute = UserAttribute.find(params[:id])
    begin
      @attribute = UserAttribute.find(params[:id])
    rescue
      @attribute = UserAttribute.new
      @user = User.find( params[:user_id] )
      @attribute.user = @user
    end
  end

  def signed_in_user
    redirect_to sign_in_url, notice: "Please sign in." unless signed_in?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_attribute_params
    params.require(:user_attribute).permit(:key, :value, :user_id)
  end
end