class NotesController < ApplicationController

  before_action :authenticate_user!

  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.where(:id=> params[:id])
  end

  def create
    @note = current_user.notes.create(notes_params)
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
    def notes_params
      params.require(:note).permit(:title, :body)
    end
end
