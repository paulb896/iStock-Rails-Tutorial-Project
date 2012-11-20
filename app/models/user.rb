class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :username, :message => "Please fill in a username", :allow_blank => false
  validates_presence_of :email, :message => "Please fill in an email", :allow_blank => false
  validates_presence_of :password, :message => "Please fill in a password", :allow_blank => false, :if => :should_validate?

  def should_validate?
    if self.password.nil?
      return false
    end

    return true
  end

  def generate_password_reset_token
    self.password_reset_token = SecureRandom.urlsafe_base64
  end

  def send_password_reset
    generate_password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
