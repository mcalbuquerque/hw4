class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id        
        redirect_to "/places"
        flash[:notice] = "Welcome to Travel Log"
      else
        flash[:notice] = "Incorrect Username or Password"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Login"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye!"
    redirect_to "/sessions/new"
  end
end
  