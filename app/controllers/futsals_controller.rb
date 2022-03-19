class FutsalsController < ApplicationController
  before_action :set_futsal, only: %i[ show edit update destroy ]

  # GET /futsals or /futsals.json
  def index
    @futsals = if params[:location]
                Futsal.where(approve: true, location: ['lower(location) = ?', params[:location].downcase])
               else
                Futsal.where(approve: true)
               end
  end

  # GET /futsals/1 or /futsals/1.json
  def show
    @bookings = Booking.where(futsal_id: @futsal)
  end

  # GET /futsals/new
  def new
    @futsal = Futsal.new
  end

  # GET /futsals/1/edit
  def edit
  end

  # POST /futsals or /futsals.json
  def create
    @futsal = Futsal.new(futsal_params)

    respond_to do |format|
      if @futsal.save
        format.html { redirect_to @futsal, notice: "Futsal was successfully created." }
        format.json { render :show, status: :created, location: @futsal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @futsal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /futsals/1 or /futsals/1.json
  def update
    respond_to do |format|
      if @futsal.update(futsal_params)
        format.html { redirect_to @futsal, notice: "Futsal was successfully updated." }
        format.json { render :show, status: :ok, location: @futsal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @futsal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /futsals/1 or /futsals/1.json
  def destroy
    @futsal.destroy
    respond_to do |format|
      format.html { redirect_to futsals_url, notice: "Futsal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_futsal
      @futsal = Futsal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def futsal_params
      params.require(:futsal).permit(:name, :location, :image, :price_per_hour, :owner_name, :capacity, :contact_no, :bio).merge(user_id: current_user.id)
    end
end
