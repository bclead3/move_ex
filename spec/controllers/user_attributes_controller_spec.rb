require 'spec_helper'

describe UserAttributesController do
  let(:u_attr) { FactoryGirl.create(:attr1) }
  let(:user)    { FactoryGirl.create(:user) }
  let(:valid_attributes) { { key: "This", value:"That", user_id: user.id } }
  let(:valid_attributes_two) { { key:"Some", value:"One", user_id: user.id} }
  before :each do
    @current_user = mock_model(User, id: 12)
    controller.stub(:current_user).and_return(@current_user)
    controller.stub(:signed_in?).and_return(:true)
  end

  describe "GET show" do
    it "assigns the requested attribute as @attribute" do
      get :show, {:id => u_attr.to_param}
      assigns(:attribute).should eq(u_attr)
    end
  end

  describe "GET new" do
    it "assigns a new attribute as @attribute, with a pre-filled-in user" do
      get :new, {:format => user.id}
      assigns(:attribute).should be_a_new(UserAttribute)
      assigns(:attribute).user.should eq(user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => u_attr.to_param}
      assigns(:attribute).should eq(u_attr)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UserAttribute" do
        before_count = UserAttribute.where(user_id:user.id).count
        post :create, {user_attribute: valid_attributes_two}
        after_count = UserAttribute.where(user_id:user.id).count
        (after_count - before_count).should eq(1)
      end

      it "assigns a newly created attribute as @attribute" do
        post :create, {user_attribute: valid_attributes}
        assigns(:attribute).should be_a(UserAttribute)
        assigns(:attribute).should be_persisted
      end

      it "redirects to the created attribute" do
        post :create, {user_attribute: valid_attributes}
        response.should redirect_to(UserAttribute.last)
      end
    end
  end

  describe "PUT update" do
    it "updates the requested user attribute" do
      u_attr2 = UserAttribute.create! valid_attributes
      UserAttribute.any_instance.should_receive(:update).with({ "key" => "4321" })
      put :update, {:id => u_attr2.to_param, :user_attribute => { "key" => "4321" }}
    end

    it "assigns the requested attribute as @attribute" do
      u_attr2 = UserAttribute.create! valid_attributes
      put :update, {:id => u_attr2.to_param, :user_attribute => valid_attributes}
      assigns(:attribute).should eq(u_attr2)
    end

    it "redirects to the user" do
      u_attr2 = UserAttribute.create! valid_attributes
      put :update, {:id => u_attr2.to_param, :user_attribute => valid_attributes}
      response.should redirect_to(u_attr2)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attribute" do
      u_attr2 = UserAttribute.create! valid_attributes
      expect {
        delete :destroy, {:id => u_attr2.to_param}
      }.to change(UserAttribute, :count).by(-1)
    end

    it "redirects to the users list" do
      u_attr2 = UserAttribute.create! valid_attributes
      delete :destroy, {:id => u_attr2.to_param}
      response.should redirect_to(users_path)
    end
  end
end
