class Employers::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(employer)

           employer_path(@employer)

  end

end
