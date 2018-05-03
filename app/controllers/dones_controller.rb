class DonesController < ApplicationController
  before_action :set_done, only: [:show, :edit, :update, :destroy, :like, :unvote]

  # GET /dones
  # GET /dones.json
  def index
    @dones = Done.all
  end

  # GET /dones/1
  # GET /dones/1.json
  def show
  end

  # GET /dones/new
  def new
    @done = Done.new
  end

  # GET /dones/1/edit
  def edit
  end

  # POST /dones
  # POST /dones.json
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @done = @challenge.dones.build(done_params)
    @done.user_id = current_user.id
    if @done.save
          redirect_to @challenge
      else
          redirect_to @challenge
      end
  end

  # PATCH/PUT /dones/1
  # PATCH/PUT /dones/1.json
  def update
    respond_to do |format|
      if @done.update(done_params)
        format.html { redirect_to @done, notice: 'Done was successfully updated.' }
        format.json { render :show, status: :ok, location: @done }
      else
        format.html { render :edit }
        format.json { render json: @done.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dones/1
  # DELETE /dones/1.json
  def destroy
    @done.destroy
    respond_to do |format|
      format.html { redirect_to dones_url, notice: 'Done was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @done.liked_by current_user
    redirect_to :back
  end

  def unvote
    @done.unvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_done
      @done = Done.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def done_params
      params.require(:done).permit(:user_id, :challenge_id, :photo, :movie)
    end
end
