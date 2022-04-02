class BookingController < ApplicationController
  before_action :booking_params
  before_action :fetch_booking, only: %i[update destroy]
  skip_before_action :verify_authenticity_token, only: :payment
  def index
    @bookings = Booking.where(user_id: current_user).sort
  end

  def create
    booking = Booking.new(booking_params)

    respond_to do |format|
      if booking.save
        FutsalBookMailer.send_booked_mail(current_user).deliver
        flash[:success] = "Futsal successfully Booked"
        format.html { redirect_to futsals_path }
        format.json { render :show, status: :created, location: @futsal }
      else
        flash[:error] = "Something went Wrong"
        format.html { redirect_to futsals_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        flash[:success] = "Booking was successfully updated." 
        format.html { redirect_to futsals_path }
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

  def payment
    response = Khalti::Verification.verify(params[:token], params[:amount])
    Booking.find(params[:booking_id]).update(payment_id: response.dig("idx")) if response.dig("state", "name")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def fetch_booking
    @booking = Booking.find_by(id: booking_params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.permit(:id, :futsal_id, :payment_id, :starts_at, :ends_at).merge(user_id: current_user.id)
  end
end
