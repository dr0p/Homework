require 'spec_helper'
require 'coveralls'
Coveralls.wear!

describe Question do

  it "has valid factory" do
    expect(FactoryGirl.build(:question)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:question, name: nil)).not_to be_valid
  end

  it "is invalid without a content" do
    expect(FactoryGirl.build(:question, content: nil)).to have(1).errors_on(:content)
  end

  it "is invalid without a question mark on the end of name" do
    expect(FactoryGirl.build(:question, name: "BotBotBot!")).to have(1).errors_on(:name)
  end

  it "is invalid by too long name's length" do
    too_long_name = ""
    101.times { too_long_name << "?" }
    expect(FactoryGirl.build(:question, name: too_long_name)).to have(1).errors_on(:name)
  end

  it "is invalid by too short name's length" do
    expect(FactoryGirl.build(:question, name: "?")).to have(1).errors_on(:name)
  end

  it "is created too often"

end

