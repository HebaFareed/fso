class AddPaymentAmountToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :payment_amount, :float, default: 10
  end
end
