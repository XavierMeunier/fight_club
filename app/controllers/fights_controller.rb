class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  # GET /fights
  def index
    @fights = Fight.all.order(created_at: :desc).page params[:page]
  end

  # GET /fights/1
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
  end

  # POST /fights
  def create
    fight_info = FightToWinService.new(fight_params).call
    
    @fight = Fight.new(fight_info)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: 'Fight was successfully battled.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fight_params
      params.require(:fight).permit(:winner, :looser)
    end
end
