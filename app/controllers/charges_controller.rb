class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.username}",
     amount: 15_00
   }
  end

  def create
  # Creates a Stripe Customer object, for associating
  # with the charge
   @amount = 15_00
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.update_attributes!( role: 'premium')

   flash[:notice] = "Thanks for upgrading to a premium account, #{current_user.username}!"

   redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end
end
