ActiveAdmin.register_page "Dashboard" do
   menu parent: "Dashboard" 

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
 
  content title: proc{ I18n.t("active_admin.dashboard") } do
        
      columns do
      column do
        panel "Cajas por Locales" do
        
        table do
            tr do   
             
              td "Pioneros TMs", :style => "text-align: centre;"
              td "Pioneros TT", :style => "text-align: centre;"
            end
            tr :class => "odd" do
              td @ingresos_manana = Entry.where(time_of_day: 'mañana').sum(:total_general)
              td @ingresos_tarde = Entry.where(time_of_day: 'tarde').sum(:total_general)
            end
            
            #otro local
            tr do   
              td "KM13 TM", :style => "text-align: centre;"
              td "KM13 TT", :style => "text-align: centre;"
            end
            tr :class => "odd" do
              td @ingresos_manana = Entry.where(time_of_day: 'mañana').sum(:total_general)
              td @ingresos_tarde = Entry.where(time_of_day: 'tarde').sum(:total_general)
            end
            
            
           end
          end
      end
   
   #column do
     #panel "Clientes Recientes" do
       #table_for Client.order('id desc').limit(10).each do |client|
         #column(:name)    {|client| link_to(client.name, admin_client_path(client)) }
        #end
      #end
    #end
  
  column do
panel "Ordenes/Pedidos Recientes" do
table_for Order.complete.order('id desc').limit(10) do
column("Estado") {|order| status_tag(order.state) }
column("Cliente"){|order| link_to(order.client.name, admin_client_path(order.client)) }
column("Total") {|order| number_to_currency order.total_price }
end
end
end
	column do
        panel "Pagos a proveedores" do
            table do
            tr do
              td "Pago a Proveedores"
              td "locales"
            end
            tr do
              td Entry.sum(:total_general)
              td Entry.sum(:total_general)
              
            end
           end
          
        end
      end
      
      #column do
        #panel "Ordenes recientes a Clientes por Cobrar" do
            #table do
            #tr do
              #td "Estado"
              #td "Cliente"
              #td "Total"
            #end
            #tr do
              #td Entry.sum(:total_general)
              #td Entry.sum(:total_general)
              #td Entry.sum(:total_general)
            #end
           #end
          #end
      #end
  end
     

end

 
 end # content
