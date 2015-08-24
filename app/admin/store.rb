ActiveAdmin.register Store do
    menu parent: "Store" 

  
  #menu priority: 2
  filter :name
  scope :all, :default => true
  belongs_to :entry, optional: true
  permit_params :name,:id


  index do
    selectable_column
    column :id
    column :name
    column :updated_at
    actions
  end

    

 
end
