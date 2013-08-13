require 'spec_helper'

describe Address do
  let(:factory_address) { FactoryGirl.create(:address) }

  subject { factory_address }

  it { should respond_to(:user) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:postal_code) }
end
