class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :shape, :update, :upgrade, :destroy]

  # GET /fighters
  def index
    @fighters = Fighter.all
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

  # POST /fighters/1
  def upgrade
    valid_upgrade = UpgradeFighterValidationService.new(@fighter, fighter_upgrade_params).call
    
    if valid_upgrade[:valid]
      fighter_upgrade_params[:available_upgrade] = 0
    end

    respond_to do |format|
      if @fighter.update(fighter_upgrade_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully upgraded.' }
      else
        format.html { render :shape }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
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
      params.require(:fighter).permit(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_upgrade_params
      params.require(:fighter).permit(:health, :strength)
    end
end
