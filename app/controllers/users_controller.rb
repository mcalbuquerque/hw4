class UsersController < ApplicationController
  def new
    @user = User.new
    @user.password = BCrypt::Password.create(params["user"]["password"])
  end

  def create
    @user = User.new(params["user"])
    @user.save
    redirect_to "/"
    redirect_to "/places"
  end
end
