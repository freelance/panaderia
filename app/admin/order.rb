ActiveAdmin.register Order do
  permit_params  :user_id, :client_id,:checked_out_at, :total_price, :store_id ,itemizable_attributes: [:all]

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
	column("Total") {|order| number_to_currency order.total_price }
end

	show do
		panel "Invoice" do
		table_for(order.line_items) do |t|
		t.column("Producto") {|item| auto_link item.product }
		t.column("Precio") {|item| number_to_currency item.price }
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
	row :email
	end
	end
	
	
end

