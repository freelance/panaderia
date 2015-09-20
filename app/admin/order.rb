ActiveAdmin.register Order do
  menu parent: "Facturacion" 

	permit_params  :client_id,:checked_out_at, :payment_status, :total_price, :store_id ,itemizable_attributes: [:all],  products_attributes: [:name,:description, :price]

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

# form do |f|
 #f.input :payment_status, as: :select, collection: Order.payment_statuses.keys, label: "Payment Status"
#end


  filter :total_price
	filter :checked_out_at
	scope :all, :default => true
	scope :in_progress
	scope :complete

index do
	column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
	column("State") {|order| status_tag(order.state) }
	column("Date", :checked_out_at)
	column("Client", :client, :sortable => :client_id)
  column("Product")
	column("Total") {|order| number_to_currency order.total_price }
end

		show do
			panel "Invoice" do
				table_for(order) do |t|
					t.column("Producto") {|item| auto_link item.products.map(&:name) }
					t.column("Precio") {|item| number_to_currency item.products.map(&:price) }
					tr :class => "odd" do
					td "Total:", :style => "text-align: right;"
					td number_to_currency(order.total_price)
				end
			end
		end
	end
	
	
	sidebar :client_information, :only => :show do
		attributes_table_for order.client do
			row("Cliente") { auto_link order.client }
			
		end
	end
	
	
	
	#formularios
	form do |f|
    f.inputs "Order" do 
      f.input :client_id, as: :select, collection:Client.pluck(:name,:id), label: "Cliente"
      f.input :checked_out_at, as: :datepicker, label: "Date"
      f.input :products, as: :check_boxes, collection: Product.all, label: "Producto"
      f.input :total_price
      f.input :updated_at
    end

    f.has_many :products do |product|      
      product.input :name
      product.input :price
     	
    end

    f.actions
  end

	
	
end

