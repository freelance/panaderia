ActiveAdmin.register Entry do
menu :priority => 3
permit_params :bill, :store_id

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


index do
    selectable_column
    #column :id
    column :store_id
    column :turn
    column :initial_value
    column :bill
    column :quantity
    column :posnet
    column :date
    column :updated_at
    #actions
    
end

 
end
