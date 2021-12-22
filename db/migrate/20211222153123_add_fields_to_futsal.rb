class AddFieldsToFutsal < ActiveRecord::Migration[6.1]
  def change
    add_column :futsals, :price_per_hour, :float
    add_column :futsals, :owner_name, :string
    add_column :futsals, :capacity, :integer
    add_column :futsals, :contact_no, :integer
  end
end
