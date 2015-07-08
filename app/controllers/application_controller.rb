class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :apply_data

   def apply_data
    @all_stores = Store.order('created_at DESC')
   end
end
