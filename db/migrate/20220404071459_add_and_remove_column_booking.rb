class AddAndRemoveColumnBooking < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :starts_at
    remove_column :bookings, :ends_at
    add_column :bookings, :book_date, :date
    add_column :bookings, :book_time, :integer , if_not_exists: true
  end
end
