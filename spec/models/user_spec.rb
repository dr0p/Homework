require 'spec_helper'
require 'coveralls'
Coveralls.wear!

describe User do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a firstname" do
    user = build(:user, first_name: nil)
    expect(user).to have(1).errors_on(:first_name)
  end

  it "is invalid without a lastname" do
    user = build(:user, last_name: nil)
    expect(user).to have(1).errors_on(:last_name)
  end

  it "is invalid without an email" do
    user = build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    create(:user, email: "pawel@drozanski.com")
    user = build(:user, email: "pawel@drozanski.com")
    expect(user).to have(1).errors_on(:email)
  end

  it "returns a contact's full name as a string" do
    user = build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq 'John Doe'
  end

  describe "filter last name by letter" do
    before :each do
      @smith = User.create(first_name: 'John', last_name: 'Smith', email: 'jsmith@examle.com')
      @jones = User.create(first_name: 'Tim', last_name: 'Jones', email: 'tjones@example.com')
      @johnson = User.create(first_name: 'John', last_name: 'Johnson', email: 'jjohnson@example.com')
    end

    context "matching letters" do 
      it "returns a sorted array of results that match" do
        expect(User.by_letter("J")).to match_array [@johnson, @jones]
      end
    end

    context "non-matching letters" do
      it "returns a sorted array of results that don't match" do
        expect(User.by_letter("J")).not_to include @smith
      end
    end

  end

end
