ActiveAdmin.register Client do

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

  permit_params  :name
  config.batch_actions = true
  filter :name
  filter :email
  filter :created_at
  
  index do
	selectable_column
	id_column
	column :name
	column :email
	column :created_at
	actions
end


	show :title => :name do
		panel "Historial de Pedidos" do
		table_for(client.orders) do
		column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
		column("State") {|order| status_tag(order.state) }
		column("Date", :sortable => :checked_out_at){|order| pretty_format(order.checked_out_at) }
		column("Total") {|order| number_to_currency order.total_price }
			end
		end
	end


	sidebar "Client Details", :only => :show do
		attributes_table_for client, :name, :email, :created_at
	end
	
	
	sidebar "Order History", :only => :show do
		attributes_table_for client do
		row("Total Orders") { client.orders.complete.count }
		row("Total Value") { number_to_currency client.orders.complete.sum(:total_price) }
		end
	end


end
