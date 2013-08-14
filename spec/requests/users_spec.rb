require 'spec_helper'

describe "Users" do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET /users" do
    it "unauthorized request should re-route to '/sign_in/' " do
      get users_path
      response.should redirect_to('/sign_in')
    end

    it "unauthorized new user should re-route to '/sign_in/' " do
      get new_user_path
      response.status.should eq(200)
    end

    it "unauthorized edit user should re-route to '/sign_in/' " do
      get edit_user_path(user)
      response.status.should redirect_to('/sign_in')
    end

    it "unauthorized update user should re-route to /sign_in" do
      put "/users/#{user.id}"
      response.status.should redirect_to('/sign_in')
    end
  end
end
