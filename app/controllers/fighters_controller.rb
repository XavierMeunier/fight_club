class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :shape, :update, :upgrade, :destroy]

  # GET /fighters
  def index
    @fighters = Fighter.all.order(level: :asc)
  end

  # GET /fighters/1
  def show
  end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit
  end

  # GET /fighters/1/shape
  def shape
  end

  # POST /fighters
  def create
    @fighter = Fighter.new(fighter_params)

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: 'Fighter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /fighters/1
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # POST /fighters/1/upgrade
  def upgrade
    valid_upgrade = UpgradeFighterValidationService.new(@fighter, fighter_input_upgrade_params).call
    
    if valid_upgrade
      # Not using fighter_input_upgrade_params to reset available_upgrade without any external input
      fighter_upgrade_params = fighter_input_upgrade_params.merge(available_upgrade: 0)
    end

    respond_to do |format|
      if valid_upgrade && @fighter.update(fighter_upgrade_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully upgraded.' }
      else
        format.html { render :shape }
      end
    end
  end

  # DELETE /fighters/1
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:name, :avatar)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_input_upgrade_params
      params.require(:fighter).permit(:health, :strength)
    end

end
