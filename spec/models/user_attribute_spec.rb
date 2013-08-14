require 'spec_helper'

describe UserAttribute do
  let(:attribute1) { FactoryGirl.create(:attr1) }

  subject { attribute1 }
  it { should belong_to(:user) }

  it { should respond_to(:user) }
  it { should respond_to(:key) }
  it { should respond_to(:value) }
end