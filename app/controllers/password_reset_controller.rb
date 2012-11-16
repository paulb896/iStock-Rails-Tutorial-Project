class PasswordResetController < ActionController::Base
  def index
    
  end
  def create
    user = User.find_by_email(params[:user][:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => "Email sent with password reset instructions."
  end
end
