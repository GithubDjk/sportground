class AddBookTime < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :book_time, :integer, default: false, if_not_exists: true
  end
end
