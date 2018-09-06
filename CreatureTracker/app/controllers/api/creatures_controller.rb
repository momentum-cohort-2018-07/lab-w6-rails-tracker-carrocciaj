class Api::CreaturesController < ApplicationController
  before_action :set_creature, only: [:show, :update, :destroy]

  def index
    @creatures = Creature.all
    render json: @creatures
   
  end


  def show
    render json: @creature
  end


  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      render json: @creature, status: :created
    else
      render json: @creature.errors, status: :unprocessable_entity
    end
  end


  def update
    if @creature.update(creature_params)
      render json: @creature
    else
      render json: @creature.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @creature.destroy
  end

  private
   
    def set_creature
      @creature = Creature.find(params[:id])
    end


    def creature_params
      params.require(:creature).permit(:name, :species, :status)
    end
end

