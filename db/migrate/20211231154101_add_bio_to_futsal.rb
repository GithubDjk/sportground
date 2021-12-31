class AddBioToFutsal < ActiveRecord::Migration[6.1]
  def change
    add_column :futsals, :bio, :string
  end
end
