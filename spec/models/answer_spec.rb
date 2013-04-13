require 'spec_helper'

describe Answer do
  it 'has valid factory' do
    expect(FactoryGirl.build(:answer)).to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:answer, content:nil)).not_to be_valid
  end
end
