require 'spec_helper'

describe Address do
  let(:factory_address) { FactoryGirl.create(:address) }

  subject { factory_address }

  it { should belong_to(:user) }

  it { should respond_to(:user) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:postal_code) }

  it 'should provide a string representation of the address' do
    factory_address.to_s.should eq("1234 My Street Apt. 2C, Gillette WY\t\t85555")
  end
end

