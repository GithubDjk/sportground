class ChangeColumnContactType < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :contact_no, :bigint
  end
end
