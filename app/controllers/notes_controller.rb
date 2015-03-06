class NotesController < ApplicationController

  before_action :authenticate_user!

  respond_to :html, :json

  def index
    @notes = Kaminari.paginate_array(current_user.notes).page(params[:page]).per(10)
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = current_user.my_notes.new  
  end

  def create
    @note = current_user.my_notes.create(note_params)
    @note.owner = true
    if @note.save
      @note.users << current_user
      flash[:success] = "Note created successfully."
      redirect_to(root_path)
    elsif @note.title.empty?
      flash[:notice] = "Title cannot be empty."
      render :new
    else
      flash[:notice] = "Note cannot be created."
      render :new
    end
  end

  def edit
    @note =  current_user.notes.find(params[:id])
  end

  def update
    @notes = current_user.notes
    @note = current_user.notes.find(params[:id])
    if @note.update_attributes(note_params)
      if params[:commit] == 'Share'
        flash[:success] = "Note is shared with other users."
        redirect_to(root_path)
      else
        respond_with @note
      end
    else
      flash[:notice] = "Note cannot be edited."
      render :edit
    end
  end

  def delete
  end

  def destroy
    @note = current_user.my_notes.find_by_id(params[:id])
    if @note.present?
      @note.destroy
      flash[:success]= "Note deleted successfully."
    else
      flash[:notice] = "Only the creator can delete this note."
    end
    redirect_to(root_path)
  end

  def share_note
    @note = Note.find(params[:note_id])
  end

  private
  def note_params
    params.require(:note).permit(:title, :description, :user_ids => [])
  end
end