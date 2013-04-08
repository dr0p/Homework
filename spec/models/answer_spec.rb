require 'spec_helper'

describe Answer do
  it "can be instantiated" do
    Answer.new.should be_an_instance_of(Answer)
  end

  it "can be saved successfully" do
    Answer.create.should be_persisted
  end
end
