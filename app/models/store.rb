class Store < ActiveRecord::Base
  has_many :providers
  has_many :expenses
  has_many :tareas
  has_many :invoices, as: :invoiceable
end
