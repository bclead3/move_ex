require 'spec_helper'

describe SessionsController do


  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it 'returns a static page at the root' do
      { :get => "/" }.should route_to(:controller => "sessions", :action => "static")
    end
  end


end
