# encoding: utf-8
class Applicants::RegistrationsController < Devise::RegistrationsController

  def new
  @applicant = Applicant.new
  1.times { @applicant.education.build }
  1.times { @applicant.skill.build }

  end

  def edit
      education_no = @applicant.education.count
      exp_no = @applicant.experience.count
      skill_no = @applicant.skill.count
      education_no.times { @applicant.education.build }
      exp_no.times { @applicant.experience.build }
      skill_no.times { @applicant.skill.build }


  end


    def after_sign_up_path_for(applicant)
          if @applicant.paid_account
            new_payment_path
          else
             applicant_path(@applicant)
          end

    end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :sex, :city, :email, :password, :phone, :birthday, :paid_account, :avatar, :status, :cv , education_attributes: [:id, :degree, :field, :graduation_place, :graduation_year, :_destroy], experience_attributes:[:id, :title, :company, :period, :description, :_destroy], skill_attributes: [:id,:skill,:_destroy]) }
    devise_parameter_sanitizer.for(:edit) { |u| u.permit(:first_name, :second_name, :sex, :city, :email, :password, :phone, :birthday, :paid_account, :avatar,:cv , education_attributes: [:id, :degree, :field, :graduation_place, :graduation_year, :_destroy], experience_attributes:[:id, :title, :company, :period, :description, :_destroy], skill_attributes: [:id,:skill,:_destroy]) }
  end
end
