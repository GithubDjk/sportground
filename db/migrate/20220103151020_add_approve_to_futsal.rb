class AddApproveToFutsal < ActiveRecord::Migration[6.1]
  def change
    add_column :futsals, :approve, :boolean, default: false
  end
end
