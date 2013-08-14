require 'spec_helper'

describe "sessions/new.html.erb" do
  it "renders sign in form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do
      assert_select "input#email[name=?]", "email"
      assert_select "input#password[name=?]", "password"
    end
  end
end
