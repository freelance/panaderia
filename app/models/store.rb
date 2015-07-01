class Store < ActiveRecord::Base
  has_many :providers
  has_many :expenses
  has_many :invoices, as: :invoiceable
  has_many :entries, :inverse_of => :store
  
  accepts_nested_attributes_for :entries, allow_destroy: true

  
 
end
