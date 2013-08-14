require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name1",
      :email => "Email1@mail.com",
      :password => "ThisIsAPassword",
      :password_confirmation => "ThisIsAPassword"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Address/)
    rendered.should match(/Create Key Value Pair/)
  end
end
