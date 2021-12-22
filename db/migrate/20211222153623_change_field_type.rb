class ChangeFieldType < ActiveRecord::Migration[6.1]
  def change
    change_column :futsals, :contact_no, :bigint
  end
end
