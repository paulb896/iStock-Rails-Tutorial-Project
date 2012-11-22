class Comment < ActiveRecord::Base
  attr_accessible :body
  validates_presence_of :body, :message => "Please fill in a comment", :allow_blank => false

  belongs_to :article
end
