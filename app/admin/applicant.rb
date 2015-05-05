ActiveAdmin.register Applicant do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

permit_params :first_name, :second_name, :sex, :city, :email, :password, :phone, :birthday, :paid_account, :avatar, :status, :cv , education_attributes: [:id, :degree, :field, :graduation_place, :graduation_year, :_destroy], experience_attributes:[:id, :title, :company, :period, :description, :_destroy], skill_attributes: [:id,:skill,:_destroy]
end
