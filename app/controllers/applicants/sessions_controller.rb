class Applicants::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(applicant)

           applicant_path(@applicant)

  end
end
