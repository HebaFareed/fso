module ApplicationHelper

    def employer_name
    :employer
  end

  def employer
    @employer ||= Employer.new
  end

    def devise_mapping
    @devise_mapping ||= Devise.mappings[:employer]
  end

def applicant_name
    :applicant
  end

  def applicant
    @applicant ||= Applicant.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:applicant]
  end

end
