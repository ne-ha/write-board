class NotesController < ApplicationController

  before_action :authenticate_user!

  def index
    @notes = current_user.notes
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = current_user.notes.new  
  end

  def create
    @note = current_user.notes.create(note_params)
    if @note.save
      flash[:success] = "Note created successfully."
      redirect_to(root_path)
    else
      flash[:notice] = "Note cannot be created."
      render :new
    end
  end

  def edit
    @note =  current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:success] = "Note edited successfully."
      redirect_to(root_path)
    else
      flash[:notice] = "Note cannot be edited."
      render :edit
    end
  end

  def delete
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    if @note.destroy
      flash[:success] = "Note deleted successfully."
    else
      flash[:notice] = "Note cannot be deleted."
    end
    redirect_to(root_path)
  end

  def share_note
    @note = Note.find(params[:note_id])
  end

  private
  
    def note_params
      params.require(:note).permit(:title, :description)
    end
end