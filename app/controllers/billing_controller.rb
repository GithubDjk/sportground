require 'stripe'
class BillingController < ApplicationController
  before_action :create_card, :fetch_futsal
  def new_card
    puts "new"
  end

  def create_card 
    Stripe.api_key = ENV['stripe_api_key']
    @amount = 1000
    respond_to do |format|
      if current_user.stripe_id.nil?
        @customer = Stripe::Customer.create({"email": current_user.email})

        current_user.update(stripe_id: customer.id)

      end

      intent = Stripe::PaymentIntent.create({
        customer: current_user.stripe_id,
        amount: @amount,
        currency: 'inr',
        payment_method_types: ['card'],
        statement_descriptor: 'Custom descriptor',
                                            })
        Stripe::PaymentIntent.confirm(
          'pi_3KgvJWSF1sw7n8H41faB57r5',
          { customer: "#{@customer}",
            type: 'card'},
        )
      card_token = params[:stripeToken]

      if card_token.nil?
        format.html { redirect_to billing_path, error: "Oops" }
      end

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token

      customer.save
      flash[:success] = "Payment Successful"
      format.html { redirect_to futsals_path }
    end
  end

  def success
    flash[:success] = "Payment Successful"
    format.html { redirect_to futsals_path }
  end

  private

  def fetch_futsal
    @futsal = Futsal.find(params[:futsal_id])
  end
end
