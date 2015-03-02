class NotesController < ApplicationController

  before_action :authenticate_user!

  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.create(note_params)
    if @note.save
      flash[:success] = "Notes created successfully."
      redirect_to(root_path)
    else
      flash[:notice] = "Notes cannot be created."
      redirect_to(new_note_path)
    end
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
  
    def note_params
      params.require(:note).permit(:title, :description)
    end
end
