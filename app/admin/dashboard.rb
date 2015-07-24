ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
 
  content title: proc{ I18n.t("active_admin.dashboard") } do
        
        
    
        
              
     
     columns do
      column do
        panel "Cajas" do
        
        table do
            tr do   
              td "Cajas-Turno Mañana", :style => "text-align: centre;"
              td "Cajas-Turno Tarde", :style => "text-align: centre;"
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
        panel "Pagos" do
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
        panel "Info de Cajas" do
        
        div do
          br
          text_node %{<iframe src="https://rpm.newrelic.com/public/charts/6VooNO2hKWB" width="300" height="200" scrolling="no" frameborder="no"></iframe>}.html_safe
        end
        
         end
       
      end
      
      
    end

    
  end # content
end
