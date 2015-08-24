ActiveAdmin.register Entry do
  permit_params  :date, :turn, :initial_value, :itemizable_type, :itemizable_id, itemizable_attributes: [:all]
  menu parent: "Store" 
   # menu false

  #menu :priority => 3

  filter :time_of_day, as: :select
  filter :date

  scope :all, :default => true
  
  scope :Mañana do |entries|
    entries.where(time_of_day: "mañana")
  end
  
  scope :Tarde do |entries|
    entries.where(time_of_day: "tarde")
  end

  scope :Melipal do |entries|
    entries.where("store_id ='1'")
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
    column "horas de día", :time_of_day
    if params['scope'] == 'manana'
      column "tiempo total" do
        "#{Entry.where(time_of_day: "mañana").search(date: params[:q]).result.sum(:total_general)}"
      end
    end

    if params['scope'] == 'tarde' 
      column "tiempo total" do
        "#{Entry.where(time_of_day: "tarde").sum(:total_general)}"
      end
    end

    column "total de día completo" do
      "#{Entry.where(time_of_day: ["tarde", "mañana"]).search(date: params[:q]).result.sum(:total_general)}"
    end
    actions
  end

  form do |f|
    f.inputs "Entry" do 
      f.input :store_id, as: :select, collection:Store.pluck(:name,:id), label: "Local"
      f.input :date, as: :datepicker, label: "Date"
      #as: :datepicker, datepicker_options: { min_date: "2013-10-8",max_date: "+3D" }
      f.input :turn
      f.input :initial_value
      f.input :posnet
      f.input :total_general
      f.input :time_of_day, as: :select, collection: Entry::TIME_OF_DAY
      f.input :updated_at
    end

    f.has_many :bills do |bill|      
      bill.input :bill
      bill.input :quantity
      bill.input :total	
    end

    f.actions
  end

  permit_params :bill, :store_id, :date, :turn, :initial_value, :posnet, :total_general, :updated_at, :time_of_day, bills_attributes: [:bill,:quantity, :total]
  
  
end
