class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy, :completed, :uncompleted]
  before_action :check_user_authentication, except: [:add_from_text, :bulk_add]
  before_action :check_admin_authentication, only: [:add_from_text, :bulk_add]

  def add_from_text
  end

  def bulk_add
    @campaign_id = params.fetch(:campaign_id)
    @text = params.fetch(:text)
    @addresses = @text.split(/\s*- - -s*/).map(&:strip).reject do |str|
      str.blank? || str.starts_with?("Writing for")
    end
    @confirm = params.fetch(:confirm, false)
    @addresses.each { |address| Address.create(address: address, campaign_id: @campaign_id) } if @confirm
  end

  def next
    @address = Address.available.first
    if @address.present?
      @address.update!(status: :in_use)
      redirect_to address_path(@address)
    else
      redirect_to none_left_addresses_path
    end
  end

  def completed
    @address.update!(status: :completed)
    # redirect_to next_addresses_path
  end

  def uncompleted
    @address.update(status: :available)
  end

  def none_left
  end

  def get_an_address
  end

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.fetch(:address, {}).permit(:address)
    end
end
