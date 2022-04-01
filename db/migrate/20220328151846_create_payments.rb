class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :transaction_id
      t.string :type
      t.string :state
      t.integer :amount
      t.string :khalti_user
      t.string :merchant
      t.string :token
      t.string :cashback
      t.string :product_identity
      t.integer :user_id

      t.timestamps
    end
  end
end
