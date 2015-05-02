class AddPaymentAmountToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :payment_amount, :float, default: 10
  end
end
