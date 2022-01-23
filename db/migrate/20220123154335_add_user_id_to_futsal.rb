class AddUserIdToFutsal < ActiveRecord::Migration[6.1]
  def change
      add_column :futsals, :user_id, :integer unless column_exists?(:futsals, :user_id)
  end
end
