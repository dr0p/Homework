require 'spec_helper'

describe User do

  it "is valid with a firstname and lastname" do
    user = User.new(
      first_name:  'Pawel',
      last_name:   'Drozanski',
      email:      'pawel@drozanski.pl')
    expect(user).to be_valid
  end

  it "is invalid without a firstname" do
    expect(User.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without a lastname" do
    expect(User.new(first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without an email" do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate email address" do
    User.create(
      first_name: 'Pawel1', last_name: 'Drozanski',
      email: 'pawel@drozanski.pl')
    user = User.new(
      first_name: 'Pawel2', last_name: 'Drozanski',
      email: 'pawel@drozanski.pl')
    expect(user).to have(1).errors_on(:email)
  end

  it "returns a contact's full name as a string" do
    user = User.new(first_name: 'Pawel', last_name: 'Drozanski',
      email: "pawel@drozanski.pl")
    expect(user.name).to eq 'Pawel Drozanski'
  end

  it "returns a sorted array of results that match" do
    smith = User.create(first_name: 'John', last_name: 'Smith',
      email: 'jsmith@examle.com')
    jones = User.create(first_name: 'Tim', last_name: 'Jones',
      email: 'tjones@example.com')
    johnson = User.create(first_name: 'John', last_name: 'Johnson',
      email: 'jjohnson@example.com')

    expect(User.by_letter("J")).to eq [johnson, jones]
  end

  it "returns a sorted array of results that don't match" do
    smith = User.create(first_name: 'John', last_name: 'Smith',
      email: 'jsmith@examle.com')
    jones = User.create(first_name: 'Tim', last_name: 'Jones',
      email: 'tjones@example.com')
    johnson = User.create(first_name: 'John', last_name: 'Johnson',
      email: 'jjohnson@example.com')

    expect(User.by_letter("J")).not_to include smith
  end
end
