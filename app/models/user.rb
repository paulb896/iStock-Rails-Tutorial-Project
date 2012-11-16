class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :username, :message => "Please fill in a username", :allow_blank => false
  validates_presence_of :email, :message => "Please fill in an email", :allow_blank => false
  validates_presence_of :password, :message => "Please fill in a password", :allow_blank => false

  def send_password_reset
    UserMailer.password_reset(self).deliver
  end
end
