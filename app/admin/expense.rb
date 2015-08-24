ActiveAdmin.register Expense do
#menu :priority => 3
  menu parent: "Store" 

permit_params :date, :turn, :store_id, :provider_id, :total_general, :description, :mount, :itemizable_type, :itemizable_id, itemizable_attributes: [:all]

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


end
