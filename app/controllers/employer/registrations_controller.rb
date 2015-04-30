class Employer::RegistrationsController< Devise::RegistrationsController

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :email, :password, :phone, :co_name, :co_type, :co_address, :co_desc, :avatar, :paid_account) }
  end
end
