ActiveAdmin.register Employer do

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

permit_params :first_name, :second_name, :email, :password, :phone, :co_name, :co_type, :co_address, :co_desc, :avatar, :paid_account

end
