ActiveAdmin.register Entry do
  permit_params :itemizable_type, :itemizable_id, itemizable_attributes: [:all]

  menu :priority => 3
  
  filter :turn

  scope :all, :default => true
  
  scope :Mañana do |entries|
    entries.where(turn:false)
  end
  
  scope :Tarde do |entries|
    entries.where(turn: true)
  end

  scope :Melipal do |entries|
    entries.where("store_id ='1'")
  end
  
  scope :Centro do |entries|
    entries.where("store_id ='2'")
  end

  scope :Km13 do |entries|
    entries.where("store_id ='3'")
  end
    
  index do
    selectable_column
    #column :id
    column :store_id
    column :turn
    column :initial_value
    #column :bill
    #column :quantity
    column :posnet
    column :date    
    column :total_general
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Entry" do 
      f.input :store_id, as: :select, collection:Store.pluck(:name,:id), label: "Local"
      f.input :date, :as => :just_datetime_picker
      f.input :turn
      f.input :initial_value
      f.input :posnet
      f.input :total_general
      f.input :updated_at
    end

    f.has_many :bills do |bill|      
      bill.input :bill
      bill.input :quantity
      bill.input :total	
    end

    f.actions
  end

  permit_params :bill, :store_id, :turn, :initial_value, :posnet, :total_general, :updated_at, bills_attributes: [:quantity, :total]
end
