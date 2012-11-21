class Article < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :body, :message => "Please fill in all fields", :allow_blank => false
  validates_presence_of :title, :message => "Please fill in all fields", :allow_blank => false
end
