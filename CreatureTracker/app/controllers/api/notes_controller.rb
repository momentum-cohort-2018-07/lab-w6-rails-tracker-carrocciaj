class Api::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  def index
    @creature = Creature.find(params[:creature_id])
    @notes = @creature.notes
    render json: @notes
  end
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
  @creature = Creature.find(params[:creature_id])

  if @note.update(note_params)
    render json: @note
  else
    render json: @note
  end
end

def destroy
  @creature = Creature.find(params[:creature_id])
  @note.destroy
  render json: @creature.notes
  
end

private 
def note_params
  params.require(:note).permit(:body)
end

def set_note
  @note = Note.find(params[:id])
end

end
