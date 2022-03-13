class BookingController < ApplicationController
  before_action :booking_params
  before_action :fetch_booking, only: %i[update destroy]
  def create
    booking = Booking.new(booking_params)

    respond_to do |format|
      if booking.save
        flash[:success] = "Futsal successfully Booked" 
        format.html { redirect_to futsals_path }
        format.json { render :show, status: :created, location: @futsal }
      else
        format.html { redirect_to futsals_path, error: "Something went Wrong" }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to futsals_path, notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      flash[:alert] = "Booking was successfully Cancelled."
      format.html { redirect_to futsals_path }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def fetch_booking
    @booking = Booking.find_by(id: booking_params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.permit(:id, :futsal_id, :payment_id, :ends_at, :number_of_players).merge(user_id: current_user.id)
  end
end
