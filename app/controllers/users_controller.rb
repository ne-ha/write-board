class UsersController < ApplicationController

  before_action :authenticate_user!
 
  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  def params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
