class AddImagesToFutsal < ActiveRecord::Migration[6.1]
  def change
    add_column :futsals, :image, :string
  end
end
