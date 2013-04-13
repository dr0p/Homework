require 'spec_helper'

describe Answer do
  it 'is valid content' do
    expect(Answer.create(content: "Good answear...")).to be_valid
  end

  it 'is invalid without content' do
    expect(Answer.create(content: nil)).not_to be_valid
  end
end
