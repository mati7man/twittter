class TweeetsController < ApplicationController
  before_action :set_tweeet, only: [:show, :edit, :update, :destroy]

  # GET /tweeets
  def index
    @tweeets = Tweeet.all.order(created_at: :desc)
  end

  # GET /tweeets/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @tweeet }
    end
  end
  
  # GET /tweeets/new
  def new
    @tweeet = Tweeet.new
  end
  
  # GET /tweeets/1/edit
  def edit
  end

  # POST /tweeets
  def create
    @tweeet = Tweeet.new(tweeet_params)

    respond_to do |format|
      if @tweeet.save
        format.html { redirect_to tweeet_path(@tweeet), notice: "Tweet was successfully created." }
        format.json { render json: @tweeet, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweeets/1
  def update
    respond_to do |format|
      if @tweeet.update(tweeet_params)
        format.html { redirect_to tweeet_path(@tweeet), notice: "Tweet was successfully updated." }
        format.json { render json: @tweeet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweeet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeets/1
  def destroy
    @tweeet.destroy!

    respond_to do |format|
      format.html { redirect_to tweeets_path, notice: "Tweet was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweeet
      @tweeet = Tweeet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweeet_params
      params.require(:tweeet).permit(:tweeet)
    end
end
