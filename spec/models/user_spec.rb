require_relative '../spec_helper'

describe User do
  let(:fact_user) { FactoryGirl.create(:user) }

  subject { fact_user }

  it { should have_one(:address) }
  it { should have_many(:user_attributes) }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:address) }
  it { should respond_to(:user_attributes) }

  describe "with a password that's too short" do
    before { fact_user.password = fact_user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { fact_user.save }

    let(:found_user) { User.find_by_email(fact_user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(fact_user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      fact_user.email = mixed_case_email
      fact_user.save
      fact_user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "user should have postal address" do
    it "should have the first address line" do
      fact_user.address.address_1.should eql("1234 My Street")
    end

    it "should have the second address line" do
      fact_user.address.address_2.should eql("Apt. 2C")
    end

    it "should have a city" do
      fact_user.address.city.should eql("Gillette")
    end

    it "should havea state" do
      fact_user.address.state.should eql("WY")
    end

    it "should have a postal code" do
      fact_user.address.postal_code.should eql("85555")
    end
  end

  describe "user should have N key-value pairs" do
    it "should have three initial KV objects" do
      fact_user.user_attributes.count.should eql(3)
    end
  end

  describe "adding KV pair" do
    let(:user2) {FactoryGirl.create(:user2)}

    it "should have two initial KV objects" do
      user2.user_attributes.count.should eql(2)
    end

    it "should have three KV objects after calling 'add_pair'" do
      user2.add_pair("this","that")
      user2.user_attributes.count.should eql(3)
      user2.get_value_from_key("this").should eql("that")
    end
  end

  describe "removing KV pair" do
    let(:user2) {FactoryGirl.create(:user2)}

    it "should allow removing KV pair by key" do
      fred_object = user2.remove_pair("fred")
      fred_object.value.should eql("The Fred")
    end
  end
end
