class Employers::RegistrationsController< Devise::RegistrationsController


  def after_sign_up_path_for(employer)
        if @employer.paid_account
          new_payment_path
        else
           employer_path(@employer)
        end

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :email, :password, :phone, :co_name, :co_type, :co_address, :co_desc, :avatar, :paid_account) }
  end
end
