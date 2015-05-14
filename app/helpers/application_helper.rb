# encoding: utf-8
module ApplicationHelper

  ARABIC_NUMBERS = %w(٠ ١ ٢ ٣ ٤ ٥ ٦ ٧ ٨ ٩)
def ta numbers
numbers = numbers.to_s if numbers.is_a? Integer
results = numbers.chars.map { |char| ARABIC_NUMBERS[char.to_i] }.join
end

    def title(page_title)
    content_for :title, page_title.to_s
  end
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

  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h4>#{sentence}</h4>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
