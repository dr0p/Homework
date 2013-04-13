class Question < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, :content, :presence => true
  validates :name, :format => { :with => /\?$/}, :length => { :in => 5..100 }
end
