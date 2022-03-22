class BillingController < ApplicationController
  def new_card
    puts "new"
  end

  def create_card 
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email})

        current_user.update(stripe_id: customer.id)

      end

      card_token = params[:stripeToken]

      if card_token.nil?
        format.html { redirect_to billing_path, error: "Oops"}
      end

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token

      customer.save
      flash[:success] = "Payment Successful" 
      format.html { redirect_to futsals_path}
    end
  end

  def success
    flash[:success] = "Payment Successful" 
    format.html { redirect_to futsals_path}
  end
private

def fetch_futsal
  @futsal = Futsal.find_by(id: params[:futsal_id])
end
end
