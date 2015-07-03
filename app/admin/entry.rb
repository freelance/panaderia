ActiveAdmin.register Entry do
menu :priority => 3
filter :turn
permit_params :bill, :store_id, :turn

scope :all, :default => true
  scope :Mañana do |entries|
    entries.where("turn ='m'")
  end
  
 scope :Tarde do |entries|
    entries.where("turn ='t'")
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
        f.input :store_id
        f.input :turn
        f.input :initial_value
        f.input :posnet
        f.input :total_general
        f.input :updated_at
      end

  f.has_many :bills do |bill|
      
        bill.input :quantity
        bill.input :total	
      end

      f.actions


end
end
