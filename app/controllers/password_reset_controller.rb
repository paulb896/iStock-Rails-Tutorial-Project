class PasswordResetController < ActionController::Base
  def index
    
  end

  def change
    user = User.find_by_password_reset_token(params[:auth_token])
    if !user.nil?
      if (params[:user][:password] != params[:user][:password_confirmation])
        redirect_to password_reset_edit_path(:auth_token => params[:auth_token]), :notice => "Password did not match"
        return
      end
      user.password = params[:user][:password]
      user.save!

      redirect_to root_path, :notice => "Password has been changed"
      return
    end
    redirect_to root_path, :notice => "Invalid user"
  end

  def create
    user = User.find_by_email(params[:user][:email])
    user.send_password_reset if user
    redirect_to root_path, :notice => "Email sent with password reset instructions."
  end

  def edit
    if (!params[:auth_token].nil?)
      user = User.find_by_password_reset_token(params[:auth_token])
      if (!user.nil?)
        @user = user
        @auth_token = params[:auth_token]
      end
    end

    if (@user.nil?)
      redirect_to root_path, :notice => "Could not find password change request"
      return
    end
  end
end
