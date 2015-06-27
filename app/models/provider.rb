class Provider < ActiveRecord::Base
  belong_to :store
  has_many :tareas
  has_many :expenses
  has_many :invoices, as: :invoiceable
end
