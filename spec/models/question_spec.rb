require 'spec_helper'

describe Question do

  it "is valid with a name and content" do
    question = Question.new(
      name:     "What is the content?",
      content:  "Some really stupid question..")
    expect(question).to be_valid
  end

  it "is invalid without a name" do
    q = Question.create(name: nil)
    expect(q).not_to be_valid
  end

  it "is invalid without a content" do
    expect(Question.create(content: nil)).to have(1).errors_on(:content)
  end

  it "is ending with a question mark" do
    question = Question.create(name: "What is all about?", content: "Nothing...")
    expect(question.name[-1]).to eq '?'
  end
  
  it "isn't ending with a question mark" do
    question = Question.create(name: "Spam bot...", content: "Spam bot...")
    expect(question).to have(1).errors_on(:name)
  end

  it "is valid name's length" do
    question = Question.create(name:"Can you answear me?", content: "I really need answear...")
    expect(question).to be_valid
  end

  it "is too long name's length" do
    too_long_name = ""
    101.times { too_long_name << "?" }
    question = Question.create(name: too_long_name, content: "I really need answear...")
    expect(question).to have(1).errors_on(:name)
  end

  it "is too short name's length" do
    question = Question.create(name:"?", content: "I really need answear...")
    expect(question).to have(1).errors_on(:name)
  end

end

