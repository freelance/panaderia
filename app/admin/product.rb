ActiveAdmin.register Product do
 permit_params :title, :description,:author,:price, :featured
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

scope :all, :default => true

show :title => :title
	sidebar :product_stats, :only => :show do
	attributes_table_for resource do
	row("Venta Total") { Order.find_with_product(resource).count }
	row("Valor"){ number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
	end
end


sidebar :recent_orders, :only => :show do
	Order.find_with_product(resource).limit(5).collect do |order|
	auto_link(order)
	end.join(content_tag("br")).html_safe
end


end
