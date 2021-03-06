class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :like, :unvote]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def feed
    if logged_in?
      @challenge = current_user.challenges.build
      @feed_items = current_user.feed
      @global_feed_items = current_user.global_feed
    else
      redirect_to login_url
    end
  end

  def search
    @challenges = Challenge.where("content LIKE ?", "%#{params[:content]}%")
    render template: "challenges/index" 
  end

  def feed
    if logged_in?
      @challenge = current_user.challenges.build
      @feed_items = current_user.feed
      @global_feed_items = current_user.global_feed
    else
      redirect_to login_url
    end
  end

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
      flash[:success] = "Desafio proposto!"
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

  def like
    @challenge.liked_by current_user
    redirect_to :back
  end

  def unvote
    @challenge.unvote_by current_user
    redirect_to :back
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:content, :photo, :movie)
    end

    def correct_user
      @challenge = Challenge.find(params[:id])
      redirect_to(challenges_url) unless current_user.id == @challenge.user_id || current_user.admin?
    end
end
