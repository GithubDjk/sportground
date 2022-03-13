class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :futsal_id
      t.integer :payment_id
      t.datetime :ends_at
      t.integer :number_of_players

      t.timestamps
    end
  end
end
