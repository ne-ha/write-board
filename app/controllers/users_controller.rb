class UsersController < ApplicationController

  before_action :authenticate_user!
 
  def index
    @notes = current_user.notes
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
end
