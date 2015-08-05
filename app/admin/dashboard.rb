ActiveAdmin.register_page "Dashboard" do

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
              td @ingresos_manana = Entry.where(turn: 'm').sum(:total_general)
              td @ingresos_tarde = Entry.where(turn: 't').sum(:total_general)
            end
            
            #otro local
            tr do   
              td "KM13 TM", :style => "text-align: centre;"
              td "KM13 TT", :style => "text-align: centre;"
            end
            tr :class => "odd" do
              td @ingresos_manana = Entry.where(turn: 'm').sum(:total_general)
              td @ingresos_tarde = Entry.where(turn: 't').sum(:total_general)
            end
            
            
           end
          end
      end
      
    #end
    
  
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
      
      column do
        panel "Ordenes recientes a Clientes por Cobrar" do
            table do
            tr do
              td "Estado"
              td "Cliente"
              td "Total"
            end
            tr do
              td Entry.sum(:total_general)
              td Entry.sum(:total_general)
              td Entry.sum(:total_general)
            end
           end
          
        end
      end
      
    
      
    end

columns do
column do
        panel "Pedidos Ordenes recientes a Clientes por Cobrar" do
            table do
            tr do
              td "Estado"
              td "Cliente"
              td "Total"
            end
            tr do
              td Entry.sum(:total_general) 
              td Entry.sum(:total_general)
              td Entry.sum(:total_general)
            end
           end
          
        end
      end

end
    
  end # content

end
