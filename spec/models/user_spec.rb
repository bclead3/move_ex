require_relative '../spec_helper'

describe User do
  let(:fact_user) { FactoryGirl.create(:user) }

  subject { fact_user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
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
  end
end
