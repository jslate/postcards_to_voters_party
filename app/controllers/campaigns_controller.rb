class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :check_admin_authentication

  # GET /campaign
  # GET /campaign.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaign/1
  # GET /campaign/1.json
  def show
  end

  # GET /campaign/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaign/1/edit
  def edit
  end

  # POST /campaign
  # POST /campaign.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign/1
  # PATCH/PUT /campaign/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign/1
  # DELETE /campaign/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaign_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.fetch(:campaign, {}).
        permit(:name, :full_text, required_instructions:[], optional_instructions:[])
    end
end
