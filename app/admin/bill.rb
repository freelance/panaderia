ActiveAdmin.register Bill do
  menu :priority => 5
  filter :entry_id
  permit_params :bill, :quantity, :total
end
