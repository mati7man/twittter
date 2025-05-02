class TweeetsController < ApplicationController
  before_action :set_tweeet, only: [:show, :update, :destroy]

  # GET /tweeets
  def index
    @tweeets = Tweeet.all
    render json: @tweeets
  end

  # GET /tweeets/1
  def show
    render json: @tweeet
  end

  # POST /tweeets
  def create
    @tweeet = Tweeet.new(tweeet_params)

    if @tweeet.save
      render json: @tweeet, status: :created
    else
      render json: @tweeet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweeets/1
  def update
    if @tweeet.update(tweeet_params)
      render json: @tweeet
    else
      render json: @tweeet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweeets/1
  def destroy
    @tweeet.destroy!
    head :no_content
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
