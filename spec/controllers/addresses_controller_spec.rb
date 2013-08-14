require 'spec_helper'

describe AddressesController do
  let(:address) { FactoryGirl.create(:address) }
  let(:user)    { FactoryGirl.create(:user) }
  let(:valid_attributes) { { address_1: "1234 Five Way", address_2:nil, city:"New York", state:"NY", postal_code:"10009" } }

  before :each do
    @current_user = mock_model(User, id: 12)
    controller.stub(:current_user).and_return(@current_user)
    controller.stub(:signed_in?).and_return(:true)
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      get :show, {:id => address.to_param}
      assigns(:address).should eq(address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address, with a pre-filled-in user" do
      get :new, {:format => user.id}
      assigns(:address).should be_a_new(Address)
      assigns(:address).user.should eq(user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => address.to_param}
      assigns(:address).should eq(address)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Address" do
        expect {
          post :create, {:address => valid_attributes}
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do
        post :create, {:address => valid_attributes}
        assigns(:address).should be_a(Address)
        assigns(:address).should be_persisted
      end

      it "redirects to the created user" do
        post :create, {:address => valid_attributes}
        response.should redirect_to(Address.last)
      end
    end
  end

  describe "PUT update" do
    it "updates the requested address" do
      address = Address.create! valid_attributes
      Address.any_instance.should_receive(:update).with({ "address_1" => "4321 Sixth Avenue" })
      put :update, {:id => address.to_param, :address => { "address_1" => "4321 Sixth Avenue" }}
    end

    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      put :update, {:id => address.to_param, :address => valid_attributes}
      assigns(:address).should eq(address)
    end

    it "redirects to the user" do
      address = Address.create! valid_attributes
      put :update, {:id => address.to_param, :address => valid_attributes}
      response.should redirect_to(address)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete :destroy, {:id => address.to_param}
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the users list" do
      address = Address.create! valid_attributes
      delete :destroy, {:id => address.to_param}
      response.should redirect_to(users_path)
    end
  end
end
