require 'spec_helper'

describe "Addresses" do
  let(:user) { FactoryGirl.create(:user) }
  let(:address) { FactoryGirl.create(:address) }

  describe "GET /addresses" do
    it "unauthorized addresses request should re-route to '/sign_in/' " do
      get addresses_path
      response.should redirect_to('/sign_in')
    end

    it "unauthorized new addresses should re-route to '/sign_in/' " do
      get new_address_path
      response.should redirect_to('/sign_in')
    end

    it "unauthorized edit addresses should re-route to '/sign_in/' " do
      get edit_address_path(address)
      response.should redirect_to('/sign_in')
    end

    it "unauthorized update addresses should re-route to /sign_in" do
      put "/addresses/#{address.id}"
      response.should redirect_to('/sign_in')
    end
  end
end