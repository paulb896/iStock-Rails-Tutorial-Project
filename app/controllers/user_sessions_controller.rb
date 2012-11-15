class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user == login(params[:username], params[:password])
      redirect_back_or_to(root_path, :message => 'Welcome #{@user.username}!')
    else
      flash.now[:alert] = "Sorry invalid login credentials, b*tch."
      render :action => :new
    end
  end

  def destroy
    logout
    redirect_to(:users, :message => 'Logged out!')
  end
end