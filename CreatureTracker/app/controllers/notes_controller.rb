class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  
  def show
    @user = User.find(params[:user_id])
    render json: creature_path(@creature)
  end
  
  def create
  @creature = Creature.find(params[:user_id])
  @note = @creature.notes.create(note_params)
  render json: creature_path(@creature)
end

def update
  @creature = Creature.find(params[:user_id])

  if @note.update(note_params)
    redirect_to creature_path(@creature)
  else
    render 'edit'
  end
end

def destroy
  @creature = Creature.find(params[:creature_id])
  @note.destroy
 
  redirect_to creature_path(@creature)
end

private 
def note_params
  params.require(:note).permit(:body)
end

def set_note
  @note = Note.find(params[:id])
end

end
