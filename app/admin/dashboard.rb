ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end


                  
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
     columns do
      column do
        panel "Informacion General" do
        table do
            tr do
              td "Cajas Locales Turno Mañana"
              td "Cajas Locales Turno Tarde"
            end
            tr do
              td Entry.sum(:total_general)
              td Entry.sum(:total_general)
              
            end
           end
          end
      end
    #end

	column do
        panel "Locales" do
            table do
            tr do
              td "Pago a Proveedores"
              td "Cajas Locales Turno Tarde"
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
        
         # table_for Entries.joins(:store).order("stores.name, entries.name") do |t|
        
        
          #table_for Table.joins(:school).order("schools.name, tables.name") do |t|
           # t.column("Locales") { |row| row.store.name }
           # t.column("Mesa") { |row| link_to(row.name, edit_admin_table_path(row.id)) }
           # t.column("Votos Sí") { |row| row.votes_yes }
           # t.column("Votos No") { |row| row.votes_no }
           # t.column("Votos en Blanco") { |row| row.votes_blank }
           # t.column("Votos Nulos") { |row| row.votes_nil }
          end
       
      end
      
      
    end
    
  end # content
end
