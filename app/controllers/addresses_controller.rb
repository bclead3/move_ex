class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def show
  end

  def new
    number = params[:format]
    @user = User.find( number )
    @address = Address.new
    @address.user = @user
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render action: 'show', status: :created, location: @address }
      else
        format.html { render action: 'new' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|

      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def set_address
    begin
      @address = Address.find( params[:id] )
    rescue
      @address = Address.new
      @user = User.find( params[:user_id] )
      @address.user = @user
    end
  end

  def signed_in_user
    redirect_to sign_in_url, notice: "Please sign in." unless signed_in?
  end

  def address_params
    params.require(:address).permit(:user_id, :address_1, :address_2, :city, :state, :postal_code)
  end
end