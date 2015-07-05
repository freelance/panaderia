ActiveAdmin.register Bill do
  menu :priority => 5
  filter :entry_id
  #permit_params :bill, :quantity, :total
  permit_params :bill, :quantity, :total, :itemizable_type, :itemizable_id, itemizable_attributes: [:all]
  
  config.sort_order = 'created_at_desc'
  config.per_page = 28

end
