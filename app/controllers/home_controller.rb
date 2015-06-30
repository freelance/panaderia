class HomeController < ApplicationController
  def index
  end
   
   def ingresos
    @ingresos_tarde = Entry.where("turn = 't'").sum(:total_general)
    @ingresos_totales = @ingresos_manana + @ingresos_tarde
  end
  
  
  
end
