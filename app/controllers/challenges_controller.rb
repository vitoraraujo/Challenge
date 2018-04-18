class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = current_user.challenges.build(challenge_params)
    if @challenge.save
      redirect_to feed_path
    else
      render :new
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    redirect_to(challenges_url)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:content)
    end

    def correct_user
      @challenge = Challenge.find(params[:id])
      redirect_to(challenges_url) unless current_user.id == @challenge.user_id || current_user.admin?
    end
end
