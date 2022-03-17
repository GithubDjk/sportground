class AddStartsAtToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :starts_at, :datetime
  end
end
