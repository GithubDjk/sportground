class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :location, :string
    add_column :users, :dob, :date
    add_column :users, :contact_no, :integer
  end
end
