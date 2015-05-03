class PaymentsController < ApplicationController


    def new
      gon.client_token = generate_client_token
    end


  def create
    if applicant_signed_in?
      @result = Braintree::Transaction.sale(
                amount: current_applicant.payment_amount,
                payment_method_nonce: params[:payment_method_nonce])
                if @result.success?

                  current_applicant.update_attribute(:paid_account, true)
                  redirect_to applicant_path(current_applicant), notice: "Congraulations! Your transaction has been successfully!"
                else
                  flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
                  gon.client_token = generate_client_token
                  render :new
                end
    elsif employer_signed_in?
      @result = Braintree::Transaction.sale(
                amount: current_employer.payment_amount,
                payment_method_nonce: params[:payment_method_nonce])
                if @result.success?
                  current_employer.update_attribute(:paid_account, true)
                  redirect_to employer_path(current_employer), notice: "Congraulations! Your transaction has been successfully!"
                else
                  flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
                  gon.client_token = generate_client_token
                  render :new
                end
    end

  end

    private
    def generate_client_token
      Braintree::ClientToken.generate
    end


end
