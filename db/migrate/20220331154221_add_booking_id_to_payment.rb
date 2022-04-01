class AddBookingIdToPayment < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :booking_id, :integer
  end
end
