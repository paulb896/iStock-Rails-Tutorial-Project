class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user === login(params[:username], params[:password])
      redirect_back_or_to(root_path, :message => 'Welcome #{@user.username}!')
    else
      flash[:message] = "Sorry invalid login credentials."
      render :action => :new
    end
  end

  def destroy
    logout
    redirect_to(:users, :notice => 'Logged out!')
  end
end
