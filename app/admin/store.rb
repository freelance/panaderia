ActiveAdmin.register Store do
  menu :priority => 2
  filter :name
  scope :all, :default => true
  belongs_to :entry, optional: true

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name,:id
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
    column :name
    column :updated_at
    #actions
    
end
    

 
end
