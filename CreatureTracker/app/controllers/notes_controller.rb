class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  
  def show
    @creature = Creature.find(params[:creature_id])
    render json: @note
  end
  
  def create
  @creature = Creature.find(params[:creature_id])
  @note = @creature.notes.create(note_params)
  render json: @note
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
